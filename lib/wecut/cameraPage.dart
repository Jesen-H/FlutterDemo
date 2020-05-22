import 'package:flutter/material.dart';

class CameraPageDart extends StatefulWidget {
  @override
  _CameraPage createState() => new _CameraPage();
}

class _CameraPage extends State<CameraPageDart>
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
        title: Text("相机"),
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
        heroTag: 'camera',
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
