import 'package:flutter/material.dart';
import 'widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Text("Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text("Login to your account",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey[700])),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextLabel("Email"),
                        customTextField(),
                        SizedBox(height: 10),
                        customTextLabel("Password"),
                        customTextField(isPassword: true),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: customButton("Login", () {}),
                  ),
                  bottomRedirectText(
                    normalText: "Don't have an account?",
                    clickableText: "Sign up",
                    onTap: () => Navigator.pushNamed(context, '/signup'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
