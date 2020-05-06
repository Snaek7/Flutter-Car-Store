import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  var onPressed;

  AppButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}
