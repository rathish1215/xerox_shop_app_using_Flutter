import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.only(bottom: 1, top: 15),
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Menu",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.upload_file),
            title: Text("Upload File"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text("Upload Image"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Payment History"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("My Orders"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
