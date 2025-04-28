import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _navigateToLogin();
    super.initState();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    Navigator.pushReplacementNamed(context, '/quickquizhome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.asset('assets/icons/app/quickquizlogo.png'),
                Positioned(
                  left:222,
                  bottom: 100,
                  child: SizedBox(
                    width: 35,
                    child: LinearProgressIndicator(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
