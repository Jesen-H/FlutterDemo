import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AsyncDart extends StatefulWidget {
  @override
  _Async createState() => new _Async();
}

class _Async extends State<AsyncDart> {

  @override
  Widget build(BuildContext context) {
    Widget future = ListView(
      children: <Widget>[
        FutureBuilder(
          future: _getNews(),
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
            if (snapshot.hasData) {
              Response response = snapshot.data;
              return Text("${response.data.toString()}");
            } else {
              return Text("");
            }
          },
        ),
        LoadingWidget()
      ],
    );
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Future',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Flutter Future'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: "返回",
              onPressed: () {
                Navigator.pop(context, "test");
              },
            ),
            centerTitle: true),
        body: future,
      ),
    );
  }

  Future<Response> _getNews() async {
    await Future.delayed(Duration(seconds: 3), () {});

    String url = "http://v.juhe.cn/toutiao/index";
    String key = "4c52313fc9247e5b4176aed5ddd56ad7";
    String type = "keji";

    print("开始请求数据");

    Response response =
        await Dio().get(url, queryParameters: {"type": type, "key": key});
    print("请求完成");
    return response;
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//      height: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
          SizedBox(width: 10),
          new Text('正在加载中', style: TextStyle(color: Colors.black, fontSize: 15))
        ],
      ),
    );
  }
}
