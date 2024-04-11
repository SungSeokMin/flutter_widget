import 'package:flutter/material.dart';
import 'package:gg/screen/appbar_using_controller.dart';
import 'package:gg/screen/basic_appbar_tabbar_screen.dart';
import 'package:gg/screen/bottom_navigation_bar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const BasicAppBarTabBarScreen(),
                    ),
                  );
                },
                child: const Text('Basic AppBar TabBar Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AppBarUsingController(),
                    ),
                  );
                },
                child: const Text('AppBar Using Controller Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const BottomNavigationBarScreen(),
                    ),
                  );
                },
                child: const Text('Bottom NavigationBar Screen'),
              ),
            ],
          ),
        ));
  }
}
