import 'package:flutter/material.dart';
import 'package:widget_stateful/screen/home_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: Root(),
  ));
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State createState() => RootState();
}

class RootState extends State<Root> {
  Color color = Colors.blue;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: show
                      ? HomeScreen(
                          color: color,
                        )
                      : Container(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        color = color == Colors.red ? Colors.blue : Colors.red;
                      });
                    },
                    child: const Text(
                      '색깔 변경하기',
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: Text(
                      !show ? '위젯 생성하기' : '위젯 삭제하기',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
