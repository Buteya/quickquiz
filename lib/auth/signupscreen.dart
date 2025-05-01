import 'package:flutter/material.dart';
import 'package:shortquiz/models/user.dart';
import 'package:uuid/uuid.dart';

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
  var _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = UserModel(
        id: '', name: '', email: '', password: '', createdAt: DateTime.now());
    final id = const Uuid().v4();

    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('signup'),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter name';
                        }
                        if (value.isNotEmpty && value.length < 3) {
                          return 'name is too short';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'name'),
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter email';
                        }
                        if (value.isNotEmpty && !value.contains("@")) {
                          return 'please enter valid email';
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
                          return 'please enter password';
                        }
                        if (value.isNotEmpty && value.length < 6) {
                          return 'password is too short';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'password'),
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter confirm password';
                        }
                        if (value.isNotEmpty &&
                            value.length < 6 &&
                            (value != _passwordController.text)) {
                          return 'passwords don`t match';
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(labelText: 'confirm password'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                          _isLoading = true;
                        });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text('signing up...'),
                            ),
                          );
                          user.signup(
                              UserModel(
                                id: id,
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _confirmPasswordController.text,
                                createdAt: DateTime.now(),
                              ),
                              context);
                          _nameController.clear();
                          _emailController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();
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
