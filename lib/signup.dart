import 'package:flutter/material.dart';
import 'login.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 80),
                 Text("Sign up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                 SizedBox(height: 5),
                 Text("Create your account", style: TextStyle(color: Colors.grey)),
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
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
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
                 SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: 'Confirm Password',
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
                  child:  Text('Sign up', style: TextStyle(color: Colors.white)),
                ),
                 SizedBox(height: 20),
                 Center(child: Text("Or")),
                 SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side:  BorderSide(color: Colors.purple),
                    minimumSize:  Size(double.infinity, 50),
                  ),
                  child:  Text("Sign In with Google", style: TextStyle(color: Colors.purple)),
                ),
                 SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:  Text("Login", style: TextStyle(color: Colors.purple)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
