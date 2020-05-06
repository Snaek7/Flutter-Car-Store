import 'package:flutter/material.dart';

class AppFormText extends StatelessWidget {
  String label;
  String hint;
  bool isHidden;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppFormText(
    this.label,
    this.hint, {
    this.isHidden = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label, hintText: hint, hintStyle: TextStyle(fontSize: 14),),
      obscureText: isHidden,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
      },
    );
  }
}
