import 'dart:async';
import 'package:flutter/material.dart';

class StreamDart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Stream();
  }
}

class _Stream extends State<StreamDart> {
  Sink _sink;
  StreamSubscription _subscription;

  StreamController<int> _controller;
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = StreamController<int>.broadcast();
//    _sink = _controller.sink;

//    _subscription = _controller.stream.take(4).listen((event) { print('Listener: $event'); });
//    _sink.add('A');
//    _sink.add(11);
//    _sink.add(11.16);
//    _sink.add([1, 2, 3]);
//    _sink.add({'a': 1, 'b': 2});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
//    _sink.close();
//    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: StreamBuilder<int>(
        stream: _controller.stream,
        initialData: _counter,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Text('You hit me: ${snapshot.data} times');
        },
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // 每次点击按钮，更加_counter的值，同时通过Sink将它发送给Stream；
            // 每注入一个值，都会引起StreamBuilder的监听，StreamBuilder重建并刷新counter
            _controller.sink.add(++_counter);
          }),
    );
  }
}
