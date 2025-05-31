import 'dart:async';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    // Wait 3 seconds then go to Login page
    Timer(Duration(seconds: 10), () {
      print('navigating is good');
      Navigator.pushReplacementNamed(context, '/login');
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rounded container with image inside
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    75), // Circle radius half of width/height
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                // You can add a border if you want:
                // border: Border.all(color: Colors.indigo, width: 2),
              ),
              clipBehavior: Clip
                  .hardEdge, // To clip the image inside the rounded container
              child: Image.asset(
                "assets/Xeroxshoplogo.jpg",
                fit: BoxFit.cover, // Ensures image covers container
              ),
            ),

            const SizedBox(height: 24),

            Text(
              '  RIT\n  Arcade Xerox Shop',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '   Fast & Reliable Printing',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 24),

            // Loader (spinner)
            const CircularProgressIndicator(
              color: Color(0xff102ed4),
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}
