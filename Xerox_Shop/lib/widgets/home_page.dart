import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import '../pages/upload_file_page.dart';

class HomePage extends StatelessWidget {
  final String userInitial = "A"; // Replace with actual user initial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70), // ⬆ Increased height
        child: AppBar(
          backgroundColor: Colors.indigo[900],
          titleSpacing: 0,
          title: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 1, top: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/Xeroxshoplogo.jpg'),
                  radius: 20,
                ),
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 1, top: 10),
                child: Text(
                  "RIT Xerox Shop",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            //  User menu
            PopupMenuButton<String>(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 1, top: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Text(
                    userInitial,
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onSelected: (value) {
                if (value == 'profile') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("My Profile clicked")));
                } else if (value == 'logout') {
                  Navigator.pushReplacementNamed(context, '/loginpage');
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 'profile', child: Text('My Profile')),
                PopupMenuItem(value: 'logout', child: Text('Logout')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, top: 10),
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  // 🔖 cart action
                },
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: UploadFilePage(), // File upload content
    );
  }
}
