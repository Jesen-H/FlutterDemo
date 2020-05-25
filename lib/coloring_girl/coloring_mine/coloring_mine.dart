import 'package:flutter/material.dart';
import 'package:flutterapp/widget/material_app.dart';

class ColoringMine extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('我的'),
        ),
      ),
    );
  }
}