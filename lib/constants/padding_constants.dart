import 'package:flutter/material.dart';

@immutable
class PaddingConstants extends EdgeInsets {
  // sayfanın genelinde düzgün simetrik bir görüntü için standart ölçüler kullandım.
  static const double _highValue = 25;
  static const double _standartValue = 15;
  static const double _lowValue = 10;
  const PaddingConstants.highValue() : super.all(_highValue);
  const PaddingConstants.standartValue() : super.all(_standartValue);
  const PaddingConstants.lowValue() : super.all(_lowValue);
}
