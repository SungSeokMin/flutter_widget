import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Color color;

  HomeScreen({
    super.key,
    required this.color,
  }) : super() {
    print('Widget Constructor 실행');
  }

  @override
  State<StatefulWidget> createState() {
    print('createState 실행');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int score = 0;

  @override
  void initState() {
    print('initState 실행');

    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies 실행');

    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();

    print('deactivate 실행');
  }

  @override
  void dispose() {
    super.dispose();

    print('dispose 실행');
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    print('didUpdateWidget 실행');

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build 실행');

    return GestureDetector(
      onTap: () => setState(() => score++),
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(
            score.toString(),
          ),
        ),
      ),
    );
  }
}
