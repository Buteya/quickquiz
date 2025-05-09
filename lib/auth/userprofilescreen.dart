import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
              title: const Text('admin panel'),
              onTap: () {
                // Update the state of the app.
                // ...

                Navigator.of(context).pushNamed('/quickquizadminhome');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('settings'),
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
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CircleAvatar(child: Icon(Icons.person),),
              IconButton(onPressed: (){}, icon: Icon(Icons.camera)),
              TextFormField(decoration: InputDecoration(labelText: "username"),),
              TextFormField(decoration: InputDecoration(labelText: "email"),),
            ],
          ),
        ),
      ),
    );
  }
}
