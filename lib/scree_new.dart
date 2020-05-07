import 'package:flutter/material.dart';
import 'package:winncar/classExample.dart';

class DetailsUser extends StatefulWidget {
  DetailsUser({Key key, this.name, this.user}) : super(key: key);
  final String name;
  final User user;

  @override
  _DetailsUserState createState() => _DetailsUserState();
}

class _DetailsUserState extends State<DetailsUser> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),),
      body: Column(
        children: <Widget>[
           
           Text(widget.user.name)
           
        ],
      ),
    );
  }
} 