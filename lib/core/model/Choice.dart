class Choice {
  String title;
  String date;
  String description;
  String lieu;
  String imglink;

  Choice({this.title, this.date, this.description, this.lieu, this.imglink});

  Choice.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    description = json['description'];
    lieu = json['lieu'];
    imglink = json['imglink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['description'] = this.description;
    data['lieu'] = this.lieu;
    data['imglink'] = this.imglink;
    return data;
  }
}
class ChoiceList {
  List<Choice> choiceListitem = [];

  ChoiceList.fromJsonList(Map listFromDataBase) {
    listFromDataBase.forEach((key,value){
      var todoItem = Choice.fromJson(value);
      choiceListitem.add(todoItem);
    });
  }
}