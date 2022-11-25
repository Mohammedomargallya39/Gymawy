import 'package:flutter/material.dart';

class myElevatedButton extends StatelessWidget {
  const myElevatedButton(
      {Key? key,
        required this.text,
        required this.onPressed,
        this.height = 50.0,
        this.width = double.infinity,
      })
      : super(key: key);

  final String text;
  final double height;
  final double width;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
