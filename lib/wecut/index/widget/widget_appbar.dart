import 'package:flutter/material.dart';
import 'package:flutterapp/wecut/index/widget/widget_index_title.dart';
import 'package:flutterapp/wecut/index/indexPage.dart';

class MySelfWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MySelfWidget({Key key, this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(children: <Widget>[
        IndexTitle(),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: TabBar(
            labelPadding: EdgeInsets.only(left: 25, right: 25),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.pink,
            labelColor: Colors.pink[200],
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return Tab(
                child: Text(choice.title,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              );
            }).toList(),
          ),
        )
      ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
