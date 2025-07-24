import 'package:flutter/material.dart';

Widget customTextField({bool isPassword = false}) {
  return TextField(
    obscureText: isPassword,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
  );
}

Widget customTextLabel(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(height: 5),
    ],
  );
}

Widget customButton(String text, VoidCallback onPressed) {
  return Container(
    padding: EdgeInsets.only(top: 3, left: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.black),
    ),
    child: MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: onPressed,
      color: Color(0xff0095FF),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget bottomRedirectText({
  required String normalText,
  required String clickableText,
  required VoidCallback onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(normalText),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            " $clickableText",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xff0095FF),
            ),
          ),
        ),
      ),
    ],
  );
}
