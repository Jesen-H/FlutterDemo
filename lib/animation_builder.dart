import 'package:flutter/material.dart';

class AnimationBuilderDart extends StatefulWidget {
  @override
  _AnimationBuilder createState() => new _AnimationBuilder();
}

class _AnimationBuilder extends State<AnimationBuilderDart>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    final CurvedAnimation curvedAnimation =
        new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curvedAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text("Flutter AnimatedBuilder"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: "返回",
            onPressed: () {
              Navigator.pop(context, "test");
            },
          ),
          centerTitle: true),
      body: new GrowTransition(child: new LogoWidget(), animation: animation),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}
