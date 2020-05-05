import 'package:flutter/material.dart';
import 'package:myconfinement/view/Choice_Card_View.dart';
import 'package:myconfinement/view/add_article.dart';
import 'core/api_service.dart';
import 'core/model/Choice.dart';

class AboutPage extends StatefulWidget {

  @override
    _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  ApiService service = ApiService.getInstance();
  List<Choice> articleList;
  
 @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('My confinement Agenda'),
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddArticle()));
        },
        ),
      body:  FutureBuilder<List<Choice>>(
        future: service.getArticle(),
        builder: (context, snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            if (snapshot.hasData) {
              articleList = snapshot.data;
              print(articleList);
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
  Widget get _listView => ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: List.generate(articleList.length, (index) {
                return Center(
                  child: ChoiceCard(choice: articleList[index], item: articleList[index]) ?? Text("error"),
                );
            }
          )
        );
  }
