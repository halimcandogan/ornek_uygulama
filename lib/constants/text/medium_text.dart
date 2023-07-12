// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ornekuygulama/constants/color_constants.dart';

class MediumText extends StatelessWidget {
  const MediumText({
    Key? key,
    required this.text,
    this.color,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: 18,
          color: color ?? ColorConstants.black),
    );
  }
}
