import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
              Text('signup'),
              TextFormField(
                controller: _nameController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'please enter name';
                  }
                  if(value.isNotEmpty && value.length < 3){
                    return 'name is too short';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'name'),
              ),
              TextFormField(
                controller: _emailController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'please enter email';
                  }
                  if(value.isNotEmpty && !value.contains("@")){
                    return 'please enter valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                obscureText: true,
                validator: (value){
                if(value ==  null || value.isEmpty){
                  return 'please enter password';
                }
                if(value.isNotEmpty && value.length < 6){
                  return 'password is too short';
                }
                  return null;
                  },
                decoration: InputDecoration(labelText: 'password'),
              ),
              TextFormField(
                obscureText: true,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'please enter confirm password';
                  }
                  if(value.isNotEmpty && value.length<6 && (value != _passwordController.text)){
                    return 'passwords don`t match';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'confirm password'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('signing up...'),
                      ),
                    );
                  }
                },
                child: Text('signup'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Text('login!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
