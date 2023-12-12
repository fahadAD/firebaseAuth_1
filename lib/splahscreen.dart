import 'package:flutter/material.dart';

import 'Auth/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage();
  }
  void nextPage()async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.teal,
      body: Center(child: Text("Splash Screen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))),
    );
  }
}
