import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message, {Color backgroundColor = Colors.blue, Color textColor = Colors.white}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
