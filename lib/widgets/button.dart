import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomButton({
    this.text,
    this.color,
    this.width,
    this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        child: FlatButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(30.0)),
            side: BorderSide(
              color: color,
              width: 1,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
          color: color,
        ),
      ),
    );
  }
}