import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Text('drawer header'),
            ),
            ListTile(
              title: const Text('create question'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.of(context).pushNamed('/createquestion');
              },
            ),
            ListTile(
              title: const Text('create user'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "assets/icons/app/quickquizlogo.png",
              scale: 7.5,
            ),
            Text("quickquiz"),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                if (mounted) {
                  Navigator.of(context).pushNamed('/profile');
                }
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
