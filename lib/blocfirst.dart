import 'package:flutter/material.dart';
import 'package:flutterapp/bloc/baseBloc.dart';
import 'package:flutterapp/bloc/countBloc.dart';
import 'package:flutterapp/widget/material_app.dart';

class BlocFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MyMaterialApp(
        home: StreamHome(),
      ),
      bloc: CounterBloc(),
    );
  }
}

class StreamHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 获取注册的 bloc，必须先注册，再去查找
    final CounterBloc bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Test'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: StreamBuilder(
            initialData: bloc.count,
            stream: bloc.countStream,
            builder: (_, snapshot) {
              return Text('${snapshot.data}', style: TextStyle(fontSize: 20));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => bloc.dispatch(bloc.count + 1)),
    );
  }
}
