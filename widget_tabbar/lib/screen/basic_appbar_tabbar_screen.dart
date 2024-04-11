import 'package:flutter/material.dart';
import 'package:gg/const/tabs.dart';

class BasicAppBarTabBarScreen extends StatelessWidget {
  const BasicAppBarTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('BasicAppBarScreen'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: TabBar(
                indicatorColor: Colors.green,
                indicatorWeight: 4,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: EdgeInsets.zero,
                // isScrollable: true,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w100,
                ),
                tabs: TABS
                    .map(
                      (e) => Tab(
                        icon: Icon(e.icon),
                        child: Text(e.label),
                      ),
                    )
                    .toList(),
              ),
            )),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: TABS
              .map((e) => Center(
                    child: Icon(e.icon),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
