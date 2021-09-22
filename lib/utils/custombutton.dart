import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? shape;
  const CustomElevatedButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.padding,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        primary: Color(0xff30B700),
        onPrimary: Colors.white,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
            borderRadius: shape ?? BorderRadius.circular(0)),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
