import 'package:flutter/material.dart';
import 'package:flutterapp/async.dart';
import 'package:flutterapp/layout.dart';
import 'package:flutterapp/appBar.dart';
import 'package:flutterapp/pointer.dart';
import 'package:flutterapp/animation.dart';
import 'package:flutterapp/animation_builder.dart';
import 'package:flutterapp/blocfirst.dart';
import 'package:flutterapp/wecut/homePage.dart';
import 'package:flutterapp/stream.dart';
import 'package:flutterapp/widget/material_app.dart';

void main() {
  runApp(
    MyMaterialApp(title: "Flutter Demo", home: new MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Demo"),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return MaterialButton(
            onPressed: () {
              switch (index) {
                case 0:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return new LayoutDart();
                  })).then((value) => {});
                  break;
                case 1:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return new AppBarBottomSample();
                  })).then((value) => {});
                  break;
                case 2:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return new PointerDart();
                  })).then((value) => {});
                  break;
                case 3:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return new AsyncDart();
                  })).then((value) => {});
                  break;
                case 4:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return new TweenAnimationDart();
                  })).then((value) => {});
                  break;
                case 5:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return new AnimationBuilderDart();
                      })).then((value) => {});
                  break;
                case 6:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return new StreamDart();
                      })).then((value) => {});
                  break;
                case 7:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return new BlocFirst();
                      })).then((value) => {});
                  break;
                case 8:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return new HomePageDart();
                      })).then((value) => {});
                  break;
              }
            },
            color: Colors.white,
            textColor: Colors.black,
            child: new Text(entries[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  final List<String> entries = <String>['布局', '标题头', '点触事件', '异步线程的使用', '补间动画Tween', 'AnimatedBuilder构建', '测试Stream','测试BLoC', '仿Wecut'];
}
