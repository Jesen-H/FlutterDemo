import 'package:flutter/material.dart';
import 'package:flutterapp/widget/material_app.dart';

class LayoutDart extends StatefulWidget {
  @override
  _Layout createState() => new _Layout();
}

class _Layout extends State<LayoutDart> {
  bool _isFavorited = false;
  int _favoriteCount = 41;

  var text =
      "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.";

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount--;
      } else {
        _favoriteCount++;
      }
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyMaterialApp(
      title: "Flutter Layout",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: "返回",
            onPressed: () {
              Navigator.pop(context, "test");
            },
          ),
          centerTitle: true,
          title: Text("Flutter Layout"),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              "assets/images/timg.jpg",
              height: 240.0,
              fit: BoxFit.cover,
            ),
            GestureDetector(
              child: titleSection(_isFavorited, _favoriteCount),
              onTap: () {
                _toggleFavorite();
              },
            ),
            MyButton("Hgeson"),
            Container(
                padding: EdgeInsets.all(32.0),
                child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  softWrap: true,
                ))
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  var name = "";

  MyButton(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildButtonColumn(context, Icons.call, name),
          _buildButtonColumn(context, Icons.near_me, "Route"),
          _buildButtonColumn(context, Icons.share, "Share"),
        ],
      ),
    );
  }
}

Container titleSection(bool favior, int count) {

  return Container(
    padding: EdgeInsets.all(32.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          ),
        ),
        Icon(
          favior ? Icons.star : Icons.star_border,
          color: Colors.red[500],
        ),
        Text("$count"),
      ],
    ),
  );
}

//Widget titleSections = Container(
//  padding: EdgeInsets.all(32.0),
//  child: Row(
//    children: <Widget>[
//      Expanded(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Container(
//              padding: EdgeInsets.only(bottom: 8.0),
//              child: Text(
//                "Oeschinen Lake Campground",
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//            ),
//            Text(
//              "Kandersteg, Switzerland",
//              style: TextStyle(color: Colors.grey[500]),
//            )
//          ],
//        ),
//      ),
//      Icon(
//        Icons.star,
//        color: Colors.red[500],
//      ),
//      Text("41"),
//    ],
//  ),
//);

Column _buildButtonColumn(BuildContext context, IconData icon, String label) {
  Color color = Theme.of(context).primaryColor;

  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}
