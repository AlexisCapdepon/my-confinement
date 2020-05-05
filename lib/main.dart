import 'package:flutter/material.dart';
import 'package:myconfinement/view/add_article.dart';
import 'package:myconfinement/view/compass.dart';
import 'package:myconfinement/view/google_map_view.dart';
import 'package:myconfinement/view/todo_view.dart';
import './about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('sideMenu'),
     ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader( 
              accountName: new Text('My Confinement'),
              accountEmail: null,
            ),
            new ListTile(
              title: new Text('TodoApp'),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new TodoView()
                )
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('google Map'),
              onTap: () {
                 Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new GoogleMapView()
                )
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Boussole'),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new CompassView()
                )
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Agenda du confinement'),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new AboutPage()
                )
                );
              },
            )
          ],
        ),
      ) ,
    );
  }
}
