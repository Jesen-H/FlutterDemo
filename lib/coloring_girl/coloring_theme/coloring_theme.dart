import 'package:flutter/material.dart';
import 'package:flutterapp/widget/material_app.dart';

class ColoringTheme extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('主题'),
        ),
      ),
    );
  }
}