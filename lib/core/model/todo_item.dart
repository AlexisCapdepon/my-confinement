class TodoItem {
  String todotitle;
  String subtitle;
  String key;

  TodoItem({this.todotitle, this.subtitle});

  TodoItem.fromJson(Map<String, dynamic> json) {
    todotitle = json['todotitle'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todotitle'] = this.todotitle;
    data['subtitle'] = this.subtitle;
    return data;
  }
}
class TodoList {
  List<TodoItem> todoListitem = [];

  TodoList.fromJsonList(Map listFromDataBase) {
    listFromDataBase.forEach((key,value){
      var todoItem = TodoItem.fromJson(value);
      todoItem.key = key;
      todoListitem.add(todoItem);
    });
  }
}
