import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readhub/views/blockChain.dart';
import 'package:readhub/views/topics.dart';
import 'package:readhub/views/jobs.dart';
import 'package:readhub/views/news.dart';
import 'package:readhub/views/tech.dart';
import 'package:readhub/widgets/main.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);
  @override
  _WrapperState createState() => _WrapperState();
}

class _TabbarItem {
  PageStorageKey key;
  String name;
  IconData icon;
  Widget body;
  _TabbarItem(this.key, this.name, this.icon, this.body);
}

class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
  int selectedIndex = 0;
  List<_TabbarItem> tabbars = [];
  @override
  void initState() {
    tabbars = [
      new _TabbarItem(
          PageStorageKey('Topics'), '热门', Icons.merge_type, Topics()),
      new _TabbarItem(PageStorageKey('News'), '科技', Icons.details, News()),
      new _TabbarItem(PageStorageKey('Tech'), '开发者', Icons.code, Tech()),
      new _TabbarItem(PageStorageKey('BlockChain'), '区块链', Icons.all_inclusive, BlockChain()),
      new _TabbarItem(PageStorageKey('Jobs'), '招聘', Icons.face, Jobs())
    ];
    super.initState();
  }

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: tabbars.map((tabbarItem) {
            return Offstage(
              offstage: tabbars[selectedIndex].key != tabbarItem.key,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: tabbarItem.body,
              ),
            );
          }).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onTap,
          items: tabbars.map((_TabbarItem tabbarItem) {
            return BottomNavigationBarItem(
              icon: Icon(tabbarItem.icon, color: Color.fromRGBO(51, 51, 51, 1)),
              activeIcon: Icon(tabbarItem.icon, color: Color.fromRGBO(91, 134, 229, 1)),
              title: Text(tabbarItem.name, style: TextStyle(color: Color.fromRGBO(91, 134, 229, 1)),),
            );
          }).toList(),
        ));
  }
}
