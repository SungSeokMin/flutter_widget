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
          bottom: TabBar(
            labelPadding: EdgeInsets.zero,
            tabs: TABS
                .map(
                  (e) => Tab(
                    icon: Icon(e.icon),
                    child: Text(e.label),
                  ),
                )
                .toList(),
          ),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
