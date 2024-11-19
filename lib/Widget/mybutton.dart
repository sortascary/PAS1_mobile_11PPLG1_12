import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onclick;

  const MyButton({super.key, required this.text, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: onclick,
                  child: Text(text),
                ),
              );
  }
}