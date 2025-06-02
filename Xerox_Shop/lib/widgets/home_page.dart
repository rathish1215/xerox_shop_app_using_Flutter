import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../componentss/custom_drawer.dart';
import 'package:helloworld/pages/upload.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _loadSavedEmail();
  }

  Future<void> _loadSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('savedEmail');
    setState(() {
      userEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    // If still loading, show progress indicator
    if (userEmail == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // If no email saved, fallback to a default letter or empty string
    final String userInitial = (userEmail != null && userEmail!.isNotEmpty)
        ? userEmail![0].toUpperCase()
        : '';

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.blue,
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 1, top: 10),
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
                      const SnackBar(content: Text("My Profile clicked")),
                    );
                  } else if (value == 'logout') {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'profile', child: Text('My Profile')),
                  PopupMenuItem(value: 'logout', child: Text('Logout')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1, top: 10),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {
                    // Cart action
                  },
                ),
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(),
        body: UploadPage(),
      ),
    );
  }
}
