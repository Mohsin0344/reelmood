import 'package:flutter/material.dart';
import 'package:realmood/utils/constant.dart';

Widget input(hintText, TextEditingController controller,
    var validator, {var keyBoardType}) {
  return Container(
    child: TextFormField(
      keyboardType: keyBoardType != null ?TextInputType.number : TextInputType.text,
      validator: validator != null ? validator : null,
      controller: controller,
      cursorColor: tertiaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(fontSize: 14, color: secondaryColor.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: fifthColor,
        contentPadding: EdgeInsets.only(left: 30, top: 18, bottom: 18),
      ),
      style: style2,
    ),
  );
}

Widget takeInput(
    obscureText,
    hintText, TextEditingController controller, IconData suffixIcon,
    var validator) {
  return Container(
    child: TextFormField(
      validator: validator != null ? validator : null,
      controller: controller,
      cursorColor: tertiaryColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(fontSize: 14, color: secondaryColor.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: fifthColor,
        contentPadding: EdgeInsets.only(left: 30, top: 18, bottom: 18),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0, left: 16.0),
          child: Icon(
            suffixIcon,
            color: secondaryColor.withOpacity(0.7),
            size: 20,
          ),
        ),
      ),
      style: style2,
    ),
  );
}
