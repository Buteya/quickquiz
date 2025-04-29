import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('signup'),
              TextFormField(decoration: InputDecoration(labelText: 'name'),),
              TextFormField(decoration:InputDecoration(labelText: 'email'),keyboardType: TextInputType.emailAddress,),
              TextFormField(decoration: InputDecoration(labelText: 'password'),),
              TextFormField(decoration: InputDecoration(labelText: 'confirm password'),),
              ElevatedButton(onPressed: (){}, child: Text('signup'),),
              TextButton(onPressed: (){
                Navigator.of(context).pushNamed('/login');
              }, child: Text('login!'),),
            ],
          ),
        ),
      ),
    );
  }
}
