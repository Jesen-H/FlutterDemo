import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/wecut/index/widget/widget_appbar.dart';
import 'package:flutterapp/widget/material_app.dart';

class IndexPageDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyMaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            bottom: MySelfWidget(
              height: 50,
            )
          ),
          body: TabBarView(
              children: choices.map((Choice choice) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new ChoiceCard(choice: choice),
                );
              }).toList()),
        )
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '精选'),
  const Choice(title: '少女心'),
  const Choice(title: '潮酷'),
  const Choice(title: 'ins风'),
];
