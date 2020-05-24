import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/widget/material_app.dart';
import 'personPage.dart';
import 'index/indexPage.dart';
import 'cameraPage.dart';

class HomePageDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'HomePage',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = List();
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages..add(IndexPageDart())..add(CameraPageDart())..add(PersonPageDart());
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyMaterialApp(
      home: Scaffold(
        body: _buildBodyWidget(),
        bottomNavigationBar: _buildBottomNavigationBarWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return PageView.builder(
      controller: _controller,
      itemCount: _pages.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _pages[index];
      },
      onPageChanged: (index) {
        if (index != _currentIndex) {
          setState(() {
            _currentIndex = index;
          });
        }
      },
    );
  }

  Widget _buildBottomNavigationBarWidget() {
    return Container(
        height: Platform.isIOS ? 100 : 80,
        child: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              brightness: Brightness.light),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,
                  fixedColor: Colors.pink[100],
                  items: [
                    BottomNavigationBarItem(
                        title: new Container(), icon: Icon(Icons.home)),
                    BottomNavigationBarItem(
                        title: new Container(), icon: Icon(null)),
                    BottomNavigationBarItem(
                        title: new Container(), icon: Icon(Icons.person)),
                  ],
                  onTap: (index) {
                    _controller.jumpToPage(index);
                  },
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.0),
                    child: InkWell(
                      child: new Image.asset('assets/images/camera.png',
                          width: 60.0, height: 60.0),
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                          _controller.jumpToPage(_currentIndex);
                        });
                      },
                    ),
                  ))
            ],
          ),
        ));
  }
}
