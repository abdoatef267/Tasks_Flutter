import 'package:flutter/material.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Welcome Back", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
             SizedBox(height: 5),
             Text("Enter your credential to login", style: TextStyle(color: Colors.grey)),
             SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Username',
                filled: true,
                fillColor: Colors.purple[50],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
             SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
                filled: true,
                fillColor: Colors.purple[50],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize:  Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child:  Text('Login', style: TextStyle(color: Colors.white)),
            ),
             SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child:  Text("Forgot password?", style: TextStyle(color: Colors.purple)),
            ),
            SizedBox(height: 130),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
                  },
                  child:  Text("Sign Up", style: TextStyle(color: Colors.purple)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
