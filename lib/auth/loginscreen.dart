import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('login'),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter email';
                  }
                  if (value.isNotEmpty && !value.contains("@")) {
                    return 'please enter a valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter a password';
                  }
                  if (value.isNotEmpty && value.length < 6) {
                    return 'password is too short';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'password'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('loging in...'),
                      ),
                    );
                  }
                },
                child: Text('login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text('signup!'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/forgotpassword');
                },
                child: Text('forgot password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
