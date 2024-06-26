import 'package:flutter/material.dart';
import 'package:widget_scrollable/layout/main_layout.dart';
import 'package:widget_scrollable/screen/custom_scroll_view_screen.dart';
import 'package:widget_scrollable/screen/list_view_screen.dart';
import 'package:widget_scrollable/screen/scrollbar_screen.dart';
import 'package:widget_scrollable/screen/single_child_scroll_view_screen.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name,
  });
}

class HomeScreen extends StatelessWidget {
  final screens = [
    ScreenModel(builder: (_) => SingleChildScrollViewScreen(), name: 'SingleChildScrollViewScreen'),
    ScreenModel(builder: (_) => ListViewScreen(), name: 'ListViewScreen'),
    ScreenModel(builder: (_) => CustomScrollViewScreen(), name: 'CustomScrollViewScreen'),
    ScreenModel(builder: (_) => ScrollBarScreen(), name: 'ScrollBarScreen'),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screens
              .map(
                (screen) => ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: screen.builder),
                    );
                  },
                  child: Text(screen.name),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
