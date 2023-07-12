// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ornekuygulama/constants/color_constants.dart';

class HighText extends StatelessWidget {
  const HighText({
    Key? key,
    required this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: 24,
          color: color ?? ColorConstants.black),
    );
  }
}
