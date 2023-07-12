import 'package:flutter/material.dart';
import 'package:ornekuygulama/constants/color_constants.dart';
import 'package:ornekuygulama/constants/string_constants.dart';
import 'package:ornekuygulama/constants/text/high_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: ColorConstants.white),
      title: const HighText(
        text: StringConstants.akilliEvUrunleri,
        fontWeight: FontWeight.bold,
        color: ColorConstants.white,
      ),
      backgroundColor: ColorConstants.orange,
    );
  }
}
