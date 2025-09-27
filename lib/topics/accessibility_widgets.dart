import 'package:flutter/material.dart';
class AccessibilityWidgets extends StatelessWidget {
  const AccessibilityWidgets({super.key});
  @override
  Widget build(BuildContext context) {
    return SemanticsTest();
  }
}

class SemanticsTest extends StatelessWidget {
  final String imgUrl =
      'https://www.fomostore.in/cdn/shop/files/BISTAM375_1_819d72f0-fb42-459e-8eec-2d70e9888a19.jpg?v=1751272333&width=2048';
  String result =
      'You need to active the talkback to hear the widget work it said: This cool Pikachu';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
           'Semantics Widget',
            style: TextStyle(fontSize: 37),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            result,
            style: TextStyle(fontSize: 27),
            textAlign: TextAlign.center,
          ),
        ),
        Semantics(
          child: Image(image: NetworkImage(imgUrl)),
          label: 'This cool Pikaaaaachuuuuu',
          hint: 'This cool Pikaaaaachuuuuu',
        ),
      ],
    );
  }
}
