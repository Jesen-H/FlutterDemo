import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PointerDart extends StatefulWidget {
  @override
  _Pointer createState() => new _Pointer();
}

class _Pointer extends State<PointerDart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Pointer',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Pointer'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: "返回",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//              new Text('number = $')
              new GestureDetector(
                child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      border: new Border.all(width: 1, color: Colors.red)
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: new Text('长按监听事件'),
                ),
                onLongPress: () {
                  Fluttertoast.showToast(
                      msg: '长按监听事件',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      // 消息框弹出的位置
                      timeInSecForIos: 1,
                      // 消息框持续的时间（目前的版本只有ios有效）
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
              new GestureDetector(
                  child: new Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    child: new Text('抬起监听事件'),
                  ),
                  onTapUp: (detail) {
                    Fluttertoast.showToast(
                        msg: '抬起监听事件',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        // 消息框弹出的位置
                        timeInSecForIos: 1,
                        // 消息框持续的时间（目前的版本只有ios有效）
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }),
              new GestureDetector(
                child: new Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: new Text('双击监听事件'),
                ),
                onDoubleTap: () {
                  Fluttertoast.showToast(
                      msg: '双击监听事件',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      // 消息框弹出的位置
                      timeInSecForIos: 1,
                      // 消息框持续的时间（目前的版本只有ios有效）
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
              new Listener(
                child: new Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: new Text('指针Down事件'),
                ),
                onPointerDown: (event) => {
                  Fluttertoast.showToast(
                      msg: '指针Down事件',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      // 消息框弹出的位置
                      timeInSecForIos: 1,
                      // 消息框持续的时间（目前的版本只有ios有效）
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0)
                },
              ),
            ],
          ),
        ),
//        bottomNavigationBar: new BottomAppBar(
//          child: new GestureDetector(
//            child: Container(
//              color: Colors.blue,
//              height: 50.0,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  new Text("长按事件", style: TextStyle(color: Colors.white)),
//                ],
//              ),
//            ),
//            onLongPress: _tap(),
//          ),
//        ),
      ),
    );
  }
}

void MyToast(String msg) {}
