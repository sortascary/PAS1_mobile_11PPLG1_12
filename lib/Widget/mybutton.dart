import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mycolors.dart';

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
                    backgroundColor: colorheader,
                    foregroundColor: colortextW,
                  ),
                  onPressed: onclick,
                  child: Text(text),
                ),
              );
  }
}