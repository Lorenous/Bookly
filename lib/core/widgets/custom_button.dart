import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Text text;
  final Color? backgroundColor;
  final BorderRadiusGeometry borderRadius;
  const CustomButton(
      {super.key,
      required this.text,
      this.backgroundColor,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: () {},
        child: text,
      ),
    );
  }
}
