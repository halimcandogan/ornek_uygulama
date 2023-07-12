import 'package:flutter/material.dart';

enum ImageConstants {
  bkscam("bkscam.jpg"),
  bksCamLogo("bkscam_logo.png");

  final String value;
  // ignore: sort_constructors_first
  const ImageConstants(this.value);

  String get toPath => 'assets/images/$value';
  Image get toImage => Image.asset(toPath);
}
