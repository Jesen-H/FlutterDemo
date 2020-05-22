import 'package:flutter/material.dart';

abstract class BaseBloc {
  void dispose(); // 该方法用于及时销毁资源
}

class BlocProvider<T extends BaseBloc> extends StatefulWidget{
  final Widget child; // 在stream 接收通知时刷新
  final T bloc;

  BlocProvider({Key key, @required this.child, @required this.bloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BlocProviderState();
  }

  // 该方法用于返回Bloc实例
  static T of<T extends BaseBloc>(BuildContext context){
    final type = _typeOf<BlocProvider<T>>(); //获取当前Bloc类型
    //通过类型获取相应的Provider，再通过Provider获取bloc实例
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;

}

class _BlocProviderState<T> extends State<BlocProvider>{

  @override
  void dispose() {
    // TODO: implement dispose
    widget.bloc.dispose(); //及时销毁资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }
}