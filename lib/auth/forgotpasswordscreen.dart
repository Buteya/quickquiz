import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('forgot password'),
              TextFormField(decoration: InputDecoration(labelText: 'email'),),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed('/login');
              }, child: Text('submit'),),
            ],
          ),
        ),
      ),
    );
  }
}
