// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seventh_word/config/colors.dart';

import 'view/homePageView.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    elevation: 0,
                    shape: Border(
                        bottom:
                            BorderSide(color: Palette.cloudGray, width: 0.75)),
                    pinned: true,
                    floating: true,
                    backgroundColor: Colors.white,
                    snap: true,
                    title: SvgPicture.asset("lib/config/images/AppBarLogo.svg",
                        width: 50),
                    centerTitle: true,
                    bottom: TabBar(
                        labelColor: Palette.pebbleBlack,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: Theme.of(context).textTheme.subtitle1,
                        unselectedLabelColor: Palette.shadowGray,
                        indicatorWeight: 5,
                        indicator: const UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 2, color: Palette.pebbleBlack),
                        ),
                        tabs: [
                          const Tab(icon: null, text: "All"),
                          Tab(icon: null, text: "Books"),
                          const Tab(icon: null, text: "Magazines"),
                        ]),
                  )
                ],
            body: TabBarView(
              children: [
                HomePageView("All"),
                HomePageView("Books"),
                HomePageView("Magazines"),
              ],
            )));
  }
}
