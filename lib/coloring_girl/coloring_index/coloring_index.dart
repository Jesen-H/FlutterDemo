import 'package:flutter/material.dart';
import 'package:flutterapp/banner.dart';
import 'package:flutterapp/widget/material_app.dart';
import 'dart:math';

class ColoringIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ColoringIndex();
  }
}

class _ColoringIndex extends State<ColoringIndex> {
  List<BannerItem> bannerList = [];

  @override
  void initState() {
    // TODO: implement initState
    BannerItem item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/64/w1024h640/20181024/wBkr-hmuuiyw6863395.jpg''',
        '');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/99/w1024h675/20181024/FGXD-hmuuiyw6863401.jpg''',
        '');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/107/w1024h683/20181024/kZj2-hmuuiyw6863420.jpg''',
        '');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/105/w1024h681/20181024/tOiL-hmuuiyw6863462.jpg''',
        '');
    bannerList.add(item);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('填色少女')),
        body: CustomScrollView(
          slivers: <Widget>[
            _bannerView(),
            _stickView(),
            _listView(),
          ],
        ),
      ),
    );
  }

  Widget _bannerView() {
    return SliverToBoxAdapter(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: BannerWidget(
            180.0,
            bannerList,
            bannerPress: (pos, item) {
              print('第 $pos 点击了');
            },
            isHorizontal: false,
            textBackgroundColor: Colors.transparent,
          )),
    );
  }

  Widget _stickView() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 50, //收起的高度
          maxHeight: 50, //展开的最大高度
          child: Container(
            padding: EdgeInsets.only(left: 16),
            color: Colors.pink,
            alignment: Alignment.centerLeft,
            child: Text("我是标签的位置", style: TextStyle(fontSize: 18)),
          )),
    );
  }

  Widget _listView() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          height: 50,
          color: index % 2 == 0 ? Colors.white : Colors.black12,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("我是第${index}个item"),
        );
      },
      childCount: 30,
    ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
