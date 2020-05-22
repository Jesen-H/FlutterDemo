import 'package:flutter/material.dart';
import 'dart:math' as math;

class TweenAnimationDart extends StatefulWidget {
  @override
  _TweenAnimation createState() => new _TweenAnimation();
}

class _TweenAnimation extends State<TweenAnimationDart>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  //double类型动画
  Animation<double> doubleAnimation;

  //颜色动画
  Animation<Color> colorAnimation;

  //位置动画
  Animation<Offset> offsetAnimation;

  //圆角动画
  Animation<BorderRadius> radiusAnimation;

  //装饰动画
  Animation<Decoration> decorationAnimation;

  //字体动画
  Animation<TextStyle> textStyleAnimation;

  //线动画
  Animation<int> intAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //创建AnimationController
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    //animation第一种创建方式
    doubleAnimation =
        new Tween<double>(begin: 0.0, end: 200.0).animate(controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            //监听执行完毕反向执行
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              //反向执行完成，正向执行
              controller.forward();
            }
          });
    //animation第二种创建方式
    offsetAnimation = controller.drive(
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(400.0, 200.0)));

    colorAnimation =
        ColorTween(begin: Colors.yellow, end: Colors.red).animate(controller);
    radiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(0), end: BorderRadius.circular(50))
        .animate(controller);
    decorationAnimation = DecorationTween(
            begin: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(0)),
            end: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(40)))
        .animate(controller);
    textStyleAnimation = TextStyleTween(
            begin: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w100),
            end: TextStyle(
                color: Colors.purple,
                fontSize: 30,
                fontWeight: FontWeight.w700))
        .animate(controller);

    curvedAnimation =
        new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    intAnimation = IntTween(begin: 0, end: 255).animate(curvedAnimation);

    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    buildItemWidget(
        CurvedAnimation animation, MaterialColor color, String itemText) {
      return new Column(
        children: <Widget>[
          new FadeTransition(
            opacity: animation,
            child: new FlutterLogo(
              size: 100.0,
              colors: color,
            ),
          ),
          new Text(itemText)
        ],
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text("Tween动画"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: "返回",
            onPressed: () {
              Navigator.pop(context, "test");
            },
          ),
          centerTitle: true),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Container(
                height: doubleAnimation.value,
                width: doubleAnimation.value,
                child: FlutterLogo(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: offsetAnimation.value.dx),
              width: 50,
              height: 50,
              color: Colors.green,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 50,
              color: colorAnimation.value,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: radiusAnimation.value, color: Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: 200,
              decoration: decorationAnimation.value,
            ),
            Container(
              height: 50,
              child: Text(
                "Tween",
                style: textStyleAnimation.value,
              ),
            ),
            SizedBox(
              height: 10,
            ),
//            buildItemWidget(curvedAnimation, Colors.blue, 'Shake')
            Container(
              height: intAnimation.value.toDouble(),
              width: intAnimation.value.toDouble(),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    // TODO: implement transform
    return math.sin(t * math.pi * 2);
  }
}
