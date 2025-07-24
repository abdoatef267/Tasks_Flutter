import 'package:flutter/material.dart';
import 'widgets.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Sign up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("Create an account, It's free",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextLabel("Username"),
                  customTextField(),
                  SizedBox(height: 10),
                  customTextLabel("Email"),
                  customTextField(),
                  SizedBox(height: 10),
                  customTextLabel("Password"),
                  customTextField(isPassword: true),
                  SizedBox(height: 10),
                  customTextLabel("Confirm Password"),
                  customTextField(isPassword: true),
                ],
              ),
              customButton("Sign up", () {}),
              bottomRedirectText(
                normalText: "Already have an account?",
                clickableText: "Login",
                onTap: () => Navigator.pushNamed(context, '/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
