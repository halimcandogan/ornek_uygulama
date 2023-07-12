import 'package:flutter/material.dart';
import 'package:ornekuygulama/components/custom_button.dart';
import 'package:ornekuygulama/components/custom_textfield.dart';
import 'package:ornekuygulama/constants/color_constants.dart';
import 'package:ornekuygulama/constants/padding_constants.dart';
import 'package:ornekuygulama/constants/string_constants.dart';
import 'package:ornekuygulama/constants/text/high_text.dart';
import 'package:ornekuygulama/constants/text/medium_text.dart';
import 'package:ornekuygulama/locator.dart';
import 'package:ornekuygulama/services/auth_service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      body: ListView(
        children: [Header(context), Content(email: email, password: password)],
      ),
    );
  }

// pek kompleks olmadıgından method olarak çıkarttım.
  // ignore: non_constant_identifier_names
  ClipPath Header(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: ColorConstants.orange,
        child: const Center(
            child: HighText(
          text: StringConstants.akilliEvUrunleri,
          fontWeight: FontWeight.bold,
          color: ColorConstants.white,
        )),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.email,
    required this.password,
  });

  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ignore: prefer_const_constructors
      padding: PaddingConstants.highValue(),
      child: Wrap(
        runSpacing: 10,
        children: [
          const HighText(
            text: StringConstants.hosgeldiniz,
            fontWeight: FontWeight.bold,
          ),
          const MediumText(text: StringConstants.hesabinizaGirisYapiniz),
          CustomTextfield(
            controller: email,
            text: StringConstants.email,
            icon: Icons.email_outlined,
          ),
          CustomTextfield(
              obscureText: true,
              controller: password,
              text: StringConstants.password,
              icon: Icons.password_outlined),
          CustomButton(
            text: StringConstants.girisYap,
            onPressed: () {
              locator
                  .get<AuthService>()
                  .signIn(context, email: email.text, password: password.text);
            },
          ),
        ],
      ),
    );
  }
}

// Wawe Clipper- tek bu sayfada oldugundan ayrı bi componentse gerek duymadım.
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
