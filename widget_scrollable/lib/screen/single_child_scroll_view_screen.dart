import 'package:flutter/material.dart';
import 'package:widget_scrollable/const/colors.dart';
import 'package:widget_scrollable/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: renderSimple(),
    );
  }

  Widget renderContainer({required Color color, int? index}) {
    return Container(
      height: 300,
      color: color,
    );
  }

  // 1. 화면을 넘어가지 않으면 스크롤 불가능
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  // 2. 화면을 넘어가지 않아도 스크롤 가능
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics - 스크롤 안됨
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  // 3. 위젯이 잘리지 않게 스크롤
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  // 4. 여러가지 physics 정리
  Widget renderPhysics() {
    return SingleChildScrollView(
      // AlwaysScrollableScrollPhysics- 스크롤 가능
      // NeverScrollableScrollPhysics - 스크롤 불가능
      // BouncingScrollPhysics - 스크롤 튕김 (IOS 스타일)
      // ClampingScrollPhysics - 스크롤 튕김X (Android 스타일)
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  // 5. 퍼포먼스
  Widget renderPerformance() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
