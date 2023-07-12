import 'package:flutter/material.dart';
import 'package:ornekuygulama/constants/color_constants.dart';
import 'package:ornekuygulama/constants/text/low_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.color,
      this.fontSize,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? ColorConstants.orange,
          side: const BorderSide(width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: LowText(
          text: text,
          color: textColor ?? ColorConstants.white,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
