import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  final String text;
  final Function onClick;
  const KeyButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onClick();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(25),
          textStyle: TextStyle(
            fontSize: 35,
          ),
          shape: CircleBorder(),
          elevation: 6,
          shadowColor: Color.fromRGBO(0, 0, 0, 1),
        ),
        child: Text(text),
      ),
    );
  }
}
