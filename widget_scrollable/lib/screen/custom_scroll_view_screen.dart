import 'package:flutter/material.dart';
import 'package:widget_scrollable/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppBar(),
          renderChildSliverList(),
        ],
      ),
    );
  }

  // AppBar
  SliverAppBar renderSliverAppBar() {
    return SliverAppBar(
      // true: 위로 스크롤 했을 때 AppBar 노출
      floating: true,
      // AppBar 고정
      pinned: false,
      // 자석 효과 (floating이 true일 경우 사용 가능)
      snap: true,
      // 맨 위에서 한계 이상으로 스크롤 했을 때 남는 공간을 차지
      stretch: true,
      collapsedHeight: 150,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'FlexibleSpace',
          style: TextStyle(color: Colors.black),
        ),
        background: Container(
          color: Colors.blue,
        ),
      ),
      title: const Text('CustomScrollViewScreen'),
    );
  }

  // ListView 기본 생성자와 유사
  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(color: rainbowColors[e % rainbowColors.length], index: e),
            )
            .toList(),
      ),
    );
  }

  // ListView.builder 생성자와 유사
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(color: rainbowColors[index % rainbowColors.length], index: index);
        },
        childCount: 100,
      ),
    );
  }

  // GridView.count 생성자와 유사
  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(color: rainbowColors[e % rainbowColors.length], index: e),
            )
            .toList(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // GridView.builder 생성자와 유사
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(color: rainbowColors[index % rainbowColors.length], index: index);
        },
        childCount: 100,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
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
