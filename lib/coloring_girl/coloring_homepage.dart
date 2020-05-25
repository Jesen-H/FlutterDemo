import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/coloring_girl/coloring_index/coloring_index.dart';
import 'package:flutterapp/coloring_girl/coloring_mine/coloring_mine.dart';
import 'package:flutterapp/coloring_girl/coloring_theme/coloring_theme.dart';
import 'package:flutterapp/widget/material_app.dart';

class ColoringHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyMaterialApp(
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
    _pages..add(ColoringIndex())..add(ColoringTheme())..add(ColoringMine());
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
        height: 100,
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
                        title: Text('首页',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        icon: Icon(null)),
                    BottomNavigationBarItem(
                        title: Text('主题',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        icon: Icon(null)),
                    BottomNavigationBarItem(
                        title: Text('我的',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        icon: Icon(null)),
                  ],
                  onTap: (index) {
                    _controller.jumpToPage(index);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
