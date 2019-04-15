import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readhub/api/nework.dart';
import 'package:readhub/views/blockchain.dart';
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

class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
  TabController controller;
  int selectedIndex = 2;
  Network api;
  @override
  void initState() {
    api = new Network();
    controller = TabController(vsync: this, length: 5, initialIndex: selectedIndex);
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Topics(),
            News(),
            Tech(),
            BlockChain(),
            Jobs(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Material(
            color: Colors.white,
            borderOnForeground: true,
            child: TabBar(
              isScrollable: false,
              indicatorColor: Colors.transparent,
              controller: controller,
              tabs: <Widget>[
                TabBarItem(
                  text: "热门",
                  icon: Icons.merge_type,
                  selected: selectedIndex == 0,
                ),
                TabBarItem(
                  text: "科技",
                  icon: Icons.details,
                  selected: selectedIndex == 1,
                ),
                TabBarItem(
                  text: "开发者",
                  icon: Icons.code,
                  selected: selectedIndex == 2,
                ),
                TabBarItem(
                  text: "区块链",
                  icon: Icons.all_inclusive,
                  selected: selectedIndex == 3,
                ),
                TabBarItem(
                  text: "招聘",
                  icon: Icons.face,
                  selected: selectedIndex == 4,
                ),
              ],
            ),
          ),
        ));
  }
}
