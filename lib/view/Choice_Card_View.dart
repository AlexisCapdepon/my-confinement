import 'package:flutter/material.dart';
import 'package:myconfinement/core/model/Choice.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key, this.choice, this.onTap, @required this.item, this.selected: false}
    ) : super(key: key);
 
  final Choice choice;
  final VoidCallback onTap;
  final Choice item;
  final bool selected;


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
        return Card(
          color: Colors.white,
          child: Column(
              children: <Widget>[
                new Container( 
                  padding: const EdgeInsets.all(8.0),
                  child: 
                  Image.asset(
                    choice.imglink
                  )),
                  new Container( 
                  padding: const EdgeInsets.all(10.0),
                  child:                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(choice.title ?? 'default value'),
                        Text(choice.date ?? 'default value'),
                        Text(choice.description ?? 'default value'),
                        Text(choice.lieu ?? 'default value'),
                      ],
                    ),
                    
                  )
            ],
           crossAxisAlignment: CrossAxisAlignment.start,
          )
    );
  }
}