import 'package:flutter/material.dart';

//自定义MaterialApp
class MyMaterialApp extends StatelessWidget{
  final Widget home;
  String title;

  MyMaterialApp({Key key, this.title, @required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.pink[200],
        accentColor: Colors.pink[200],
        dividerColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
      title: title == null ? '' : title,
      home: home,
    );
  }

}