// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ornekuygulama/constants/color_constants.dart';
import 'package:ornekuygulama/constants/padding_constants.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    Key? key,
    required this.text,
    this.controller,
    this.icon,
    this.obscureText,
  }) : super(key: key);
  final String text;
  final IconData? icon;
  final TextEditingController? controller;
  final bool? obscureText;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: TextField(
        obscureText: widget.obscureText ?? false,
        controller: widget.controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 17,
          ),
          hintText: widget.text,
          prefixIcon: Icon(widget.icon),
          border: InputBorder.none,
          contentPadding: const PaddingConstants.standartValue(),
        ),
      ),
    );
  }
}
