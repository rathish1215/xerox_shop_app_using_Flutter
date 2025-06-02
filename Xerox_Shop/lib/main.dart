import 'package:flutter/material.dart';
import 'package:helloworld/widgets/home_page.dart';
import 'widgets/loadingpage.dart';
import 'widgets/login_page.dart';
 rathish
// import 'pages/no_internet.dart';
import 'package:helloworld/pages/upload.dart';
// import 'theme.dart';

import 'pages/no_internet.dart';
import 'package:helloworld/pages/upload.dart';
import 'theme.dart';
main

// import 'widgets/home_page.dart';

void main() {
  runApp(XeroxShopApp());
}

class XeroxShopApp extends StatelessWidget {
  const XeroxShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
rathish
      // theme: CustomTheme.light,
      // darkTheme: CustomTheme.dark,

      theme: CustomTheme.light,
      darkTheme: CustomTheme.dark,
 main
      debugShowCheckedModeBanner: false,
      initialRoute: '/upload',
      routes: {
        '/': (context) => LoadingPage(),
rathish
        '/login': (context) => const LoginPage(),
        '/home': (context) => HomePage(),
        '/upload':(context) => UploadPage(),

        '/login2': (context) => LoginPage(),
        '/upload':(context) => UploadPage(),
        // '/home': (context) => HomePage(),
 main
      },
    );
  }
}
