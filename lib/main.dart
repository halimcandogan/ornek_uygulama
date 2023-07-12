import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ornekuygulama/constants/color_constants.dart';
import 'package:ornekuygulama/firebase_options.dart';
import 'package:ornekuygulama/locator.dart';
import 'package:ornekuygulama/services/provider/auth_provider.dart';
import 'package:ornekuygulama/view/auth/login_view.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (context) => locator.get<AuthProvider>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BKSCam Örnek Uygulama',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorConstants.grayLighter,
          fontFamily: "Montserrat",
          useMaterial3: true,
        ),
        home: const LoginView());
  }
}
