import 'package:flutter/material.dart';
import 'widgets/loadingpage.dart';
import 'widgets/login_page.dart';
import 'pages/no_internet.dart';
// import 'widgets/home_page.dart';

void main() {
  runApp(XeroxShopApp());
}

class XeroxShopApp extends StatelessWidget {
  const XeroxShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/login': (context) => LoginPage(),
        // '/home': (context) => HomePage(),
      },
    );
  }
}
