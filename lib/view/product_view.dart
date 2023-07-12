// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ornekuygulama/components/custom_appbar.dart';
import 'package:ornekuygulama/constants/color_constants.dart';
import 'package:ornekuygulama/constants/image_constants.dart';
import 'package:ornekuygulama/constants/padding_constants.dart';
import 'package:ornekuygulama/constants/string_constants.dart';
import 'package:ornekuygulama/constants/text/high_text.dart';
import 'package:ornekuygulama/constants/text/medium_text.dart';
import 'package:ornekuygulama/constants/text/low_text.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    Key? key,
    required this.urunIsmi,
    required this.urunModel,
    required this.urunMacAdresi,
    required this.urunFonksiyon,
  }) : super(key: key);
  final String urunIsmi;
  final String urunModel;
  final String urunMacAdresi;
  final String urunFonksiyon;
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: CustomAppBar(),
      body: Padding(
          padding: const PaddingConstants.standartValue(),
          child: Container(
            padding: const PaddingConstants.standartValue(),
            decoration: BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              // runSpacing: 10,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ImageConstants.bksCamLogo.toImage,
                ),
                HighText(
                  text: widget.urunIsmi,
                  fontWeight: FontWeight.bold,
                ),
                const MediumText(
                  text: StringConstants.urunModel,
                  fontWeight: FontWeight.bold,
                ),
                LowText(
                  text: widget.urunModel,
                  color: ColorConstants.grayPrimary,
                ),
                const MediumText(
                  text: StringConstants.urunMacAdresi,
                  fontWeight: FontWeight.bold,
                ),
                LowText(
                  text: widget.urunMacAdresi,
                  color: ColorConstants.grayPrimary,
                ),
                const MediumText(
                  text: StringConstants.urunFonksiyon,
                  fontWeight: FontWeight.bold,
                ),
                LowText(
                  text: widget.urunFonksiyon,
                  color: ColorConstants.grayPrimary,
                )
              ],
            ),
          )),
    );
  }
}
