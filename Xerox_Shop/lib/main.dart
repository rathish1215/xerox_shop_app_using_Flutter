import 'package:flutter/material.dart';
import 'widgets/loadingpage.dart';
import 'widgets/login_page.dart';
import 'pages/no_internet.dart';
import 'package:helloworld/pages/upload.dart';
import 'theme.dart';

// import 'widgets/home_page.dart';

void main() {
  runApp(XeroxShopApp());
}

class XeroxShopApp extends StatelessWidget {
  const XeroxShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.light,
      darkTheme: CustomTheme.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: '/upload',
      routes: {
        '/': (context) => LoadingPage(),
        '/login2': (context) => LoginPage(),
        '/upload':(context) => UploadPage(),
        // '/home': (context) => HomePage(),
      },
    );
  }
}
