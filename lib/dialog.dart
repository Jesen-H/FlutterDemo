import 'package:flutter/material.dart';

class DialogDart extends StatefulWidget {
  @override
  _Dialog createState() => new _Dialog();
}

class _Dialog extends State<DialogDart> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text("弹出窗口"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: "返回",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true),
          body: MaterialButton(
            onPressed: _askedToLead,
            color: Colors.blue,
            textColor: Colors.white,
            child: new Text("打开Dialog"),
          )),
    );
  }

  Future<void> _askedToLead() async {
//    switch (await showDialog<Department>(
//        context: context,
//        builder: (BuildContext context) {
//          return SimpleDialog(
//            title: const Text('Select assignment'),
//            children: <Widget>[
//              SimpleDialogOption(
//                onPressed: () { Navigator.pop(context, Department.treasury); },
//                child: const Text('Treasury department'),
//              ),
//              SimpleDialogOption(
//                onPressed: () { Navigator.pop(context, Department.state); },
//                child: const Text('State department'),
//              ),
//            ],
//          );
//        }
//    )) {
//      case Department.treasury:
//      // Let's go.
//      // ...
//        break;
//      case Department.state:
//      // ...
//        break;
//    }
  }
}
