import 'package:flutter/material.dart';

class PersonPageDart extends StatefulWidget {
  @override
  _PersonPage createState() => new _PersonPage();
}

class _PersonPage extends State<PersonPageDart>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Center(
        child: Text("状态$_count"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        heroTag: 'person',
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
