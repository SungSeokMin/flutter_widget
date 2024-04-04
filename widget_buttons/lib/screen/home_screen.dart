import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            renderElevatedButton(),
            renderCustomElevatedButton(),
            renderOutlinedButton(),
            renderTextButton(),
            renderGestureDetectorButton(),
            renderInkWellButton(),
          ],
        ),
      ),
    );
  }

  ElevatedButton renderElevatedButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        // 메인 색깔
        backgroundColor: Colors.red,
        // 글자 및 애니메이션 색깔
        foregroundColor: Colors.white,
        // 그림자 색깔
        shadowColor: Colors.green,
        // 3D 입체감의 높이
        elevation: 10,
        padding: const EdgeInsets.all(20.0),
        side: const BorderSide(
          color: Colors.black,
          width: 4.0,
        ),
      ),
      child: const Text('ElevatedButton'),
    );
  }

  ElevatedButton renderCustomElevatedButton() {
    /*
    * Material State
    *
    * hovered - 호버링 상태
    * focused - 포커스 됐을 때 (텍스트 필드)
    * pressed - 눌렸을 때
    * dragged - 드래그 됐을 때
    * selected - 선택 됐을 때 (체크박스, 라디오 버튼)
    * scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을 때
    * disabled - 비활성화 됐을 때 (onPressed: null)
    * error - 에러상태
    * */
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return Colors.red;
          })),
      child: const Text('Elevated Button Style'),
    );
  }

  OutlinedButton renderOutlinedButton() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.green,
      ),
      child: const Text('OutlinedButton'),
    );
  }

  TextButton renderTextButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.brown,
      ),
      child: const Text('TextButton'),
    );
  }

  GestureDetector renderGestureDetectorButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Center(child: Text('GestureDetectorButton')),
      ),
    );
  }

  InkWell renderInkWellButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Center(child: Text('InkWellButton')),
      ),
    );
  }
}
