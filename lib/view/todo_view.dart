import 'package:flutter/material.dart';
import 'package:myconfinement/core/api_service.dart';
import 'package:myconfinement/core/model/todo_item.dart';
import 'package:myconfinement/ui/shared/widgets/custom_card.dart';
import 'package:myconfinement/view/add_todo_view.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  ApiService service = ApiService.getInstance();
  List<TodoItem> todoList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My confinement Todo'),
        ),
      floatingActionButton: _fabButton,
      body:  FutureBuilder<List<TodoItem>>(
        future: service.getTodos(),
        builder: (context, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            if (snapshot.hasData) {
              todoList = snapshot.data;
              return _listView; 
            }
             return Center(child: Text("error"));
              break;
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
        ),
    );
  }

  Widget dismiss (Widget child, String key){
    return Dismissible(
      child:child,
      key: UniqueKey(),
      background: Container(color: Colors.red,),
      secondaryBackground: Center(
        child: Text("Delete"),
        ),
      onDismissed: (dismissDirection)async{
        await service.deleteTodo(key);
      },
      );
  }


  Widget get _listView => ListView.separated(
        
        itemBuilder: (context, index) => dismiss(CustomCard(
          title: todoList[index].todotitle, 
          subtitle: todoList[index].subtitle
          ),
          todoList[index].key
        ),
        separatorBuilder: (context, index) => Divider(),
      
        itemCount: todoList.length);

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTodoView()));
        },
        child: Icon(Icons.add),
      );
}