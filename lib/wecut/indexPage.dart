import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexPageDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              decoration:
                  new BoxDecoration(color: Colors.pink[200], boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                    blurRadius: 15.0, //阴影模糊程度
                    spreadRadius: 1.0 //阴影扩散程度
                    )
              ]),
              padding: EdgeInsets.only(bottom: 10),
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.pink[300],
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: new Border.all(width: 2, color: Colors.white),
                      ),
                      alignment: Alignment.center,
                      child: Text("搜索用户、贴纸、话题",
                          style: TextStyle(color: Colors.white)),
                      height: 40,
                      width: 350,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      child: Icon(Icons.star),
                      height: 40,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
