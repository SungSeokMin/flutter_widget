import 'package:flutter/material.dart';
import 'package:widget_scrollable/const/colors.dart';
import 'package:widget_scrollable/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: renderSimple(),
    );
  }

  // 1. 기본 - 모두 한 번에 그림
  Widget renderSimple() {
    return ListView(
      children: numbers
          .map((number) =>
              renderContainer(color: rainbowColors[number % rainbowColors.length], index: number))
          .toList(),
    );
  }

  // 2. 빌더 - 보이는 것만 그림
  Widget renderBuilder() {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(color: rainbowColors[index % rainbowColors.length], index: index);
      },
    );
  }

  // 3. 빌더 + 중간 중간에 위젯을 추가 가능
  Widget renderSeparator() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(color: rainbowColors[index % rainbowColors.length], index: index);
      },
      separatorBuilder: (context, index) {
        return renderContainer(color: Colors.black, index: index, height: 50);
      },
    );
  }

  Widget renderContainer({required Color color, required int index, double? height}) {
    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
