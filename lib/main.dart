import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'home_list.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/homelist': (context) => HomeListPage(), 
      },
    );
  }
}
