import 'dart:async';
import 'baseBloc.dart';

class CounterBloc extends BaseBloc{
  int _count = 0;
  int get count => _count;

  //stream 广播
  StreamController<int> _controller = StreamController<int>.broadcast();

  Stream<int> get countStream => _controller.stream;    //用于StreamBuilder 的 stream

  void dispatch(int value){
    _count = value;
    _controller.sink.add(value); //通知修改
  }

  //实现基类注销资源方法
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
  }
}