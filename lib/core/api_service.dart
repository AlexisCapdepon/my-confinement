import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:myconfinement/core/model/VelovStation.dart';
import 'package:myconfinement/core/model/todo_item.dart';

import 'model/Choice.dart';

class ApiService {
  String _baseUrl ;

  static ApiService _instance = ApiService._privateConstructor();
  ApiService._privateConstructor () {
    _baseUrl = "https://flutter-my-confinement.firebaseio.com/";
  }
  static ApiService getInstance () {
    if (_instance == null) {
      return ApiService._privateConstructor();
    }
    return _instance;
  }

  Future<List<TodoItem>> getTodos () async {
    final response = await http.get("$_baseUrl/todos.json");
    
    final jsonResponse = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final todoList = TodoList.fromJsonList(jsonResponse);
        return todoList.todoListitem;
        break;
      case HttpStatus.unauthorized:
        Logger().e(jsonResponse);
        break;
    }
    return Future.error(jsonResponse);

  } 
  Future<List<Choice>>getArticle() async {
    final response = await http.get("$_baseUrl/choice.json");
    
    final jsonResponse = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final articles = ChoiceList.fromJsonList(jsonResponse);
        return articles.choiceListitem;
        break;
      case HttpStatus.unauthorized:
        Logger().e(jsonResponse);
        break;
    }
    return Future.error(jsonResponse);

  } 
  Future<VelovStation>getVelovStation() async {
    
    String url = 'https://public.opendatasoft.com/api/records/1.0/search/?dataset=station-velov-grand-lyon&rows=348&facet=name&facet=commune&facet=status&facet=available';

    final http.Response response = await http.get(url);

    return velovStationFromJson(response.body);
    //print(json);
  }

  Future<void> addTodo (TodoItem todoItem) async {
    final jsonBody = json.encode(todoItem.toJson());
    final response = await http.post("$_baseUrl/todos.json", body: jsonBody);
    
    final jsonResponse = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return Future.value(true);
        break;
      case HttpStatus.unauthorized:
        Logger().e(jsonResponse);
        break;
    }
    return Future.error(jsonResponse);

  }

  Future<void> addArticle (Choice item) async {
    final jsonBody = json.encode(item.toJson());
    final response = await http.post("$_baseUrl/choice.json", body: jsonBody);
    
    final jsonResponse = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return Future.value(true);
        break;
      case HttpStatus.unauthorized:
        Logger().e(jsonResponse);
        break;
    }
    return Future.error(jsonResponse);

  }

  Future<void> deleteTodo (String key) async {
    final response = await http.delete("$_baseUrl/todos/$key.json");
    
    final jsonResponse = json.decode(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return Future.value(true);
        break;
      case HttpStatus.unauthorized:
        Logger().e(jsonResponse);
        break;
    }
    return Future.error(jsonResponse);

  }
}