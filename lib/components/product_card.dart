// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ornekuygulama/components/custom_button.dart';
import 'package:ornekuygulama/constants/color_constants.dart';
import 'package:ornekuygulama/constants/image_constants.dart';
import 'package:ornekuygulama/constants/padding_constants.dart';
import 'package:ornekuygulama/constants/string_constants.dart';
import 'package:ornekuygulama/constants/text/low_text.dart';
import 'package:ornekuygulama/constants/text/medium_text.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.urunIsim,
    this.urunModel,
    this.urunMacAdresi,
    this.onPressed,
  }) : super(key: key);
  final String urunIsim;
  final String? urunModel;
  final String? urunMacAdresi;
  final Function()? onPressed;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const PaddingConstants.lowValue(),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: ImageConstants.bkscam.toImage,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MediumText(
                  text: widget.urunIsim,
                  fontWeight: FontWeight.bold,
                ),
                const LowText(
                  text: StringConstants.urunModel,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.grayPrimary,
                ),
                LowText(text: widget.urunModel ?? ""),
                const LowText(
                  text: StringConstants.urunMacAdresi,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.grayPrimary,
                ),
                LowText(text: widget.urunMacAdresi ?? ""),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: CustomButton(
                    text: "Detayları Görüntüle",
                    fontSize: 14,
                    onPressed: () {
                      widget.onPressed?.call();
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
