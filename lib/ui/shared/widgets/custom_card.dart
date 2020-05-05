import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String dateTime;

  const CustomCard({Key key, this.title, this.subtitle, this.dateTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.title),
        subtitle: Text(this.subtitle),
      ),
    );
  }
  
}