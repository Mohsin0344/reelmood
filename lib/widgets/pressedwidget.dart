import 'package:flutter/material.dart';
import 'package:realmood/utils/constant.dart';

Widget circleButton(function, text, IconData iconData) {
  return Column(
    children: [
      Container(
        height: 52,
        width: 52,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: fifthColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: IconButton(
                onPressed: function,
                icon: Icon(
                  iconData,
                  color: tertiaryColor,
                ))),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        text,
        style: style2.copyWith(fontSize: 10),
      ),
    ],
  );
}

customButton(text, function) {
  return ElevatedButton(
    onPressed: function,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 16),
      child: Text(
        text,
      ),
    ),
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      onPrimary: tertiaryColor,
        shadowColor: tertiaryColor,
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: tertiaryColor,width: 0.8)),
    ),
  );
}

forgetPasswordButton(text, function) {
  return ElevatedButton(
    onPressed: function,
    child: Text(
      text,
      style: style2.copyWith(fontSize: 11),
    ),
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(secondaryColor),
      backgroundColor: MaterialStateProperty.all<Color>(tertiaryColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: secondaryColor,width: 0.1)),
      ),
      shadowColor: MaterialStateProperty.all<Color>(secondaryColor),
    ),
  );
}

buyCustomButton(function) {
  return InkWell(
    onTap: function,
    borderRadius: BorderRadius.circular(40),
    splashColor: tertiaryColor,
    hoverColor: tertiaryColor,
    child: Container(
      height: 48,
      width: 120,
      decoration: BoxDecoration(
        gradient: gradient1,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Text(
        'Buy',
        style: style2.copyWith(fontSize: 13),
      )),
    ),
  );
}

shareButton() {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(15),
    child: Container(
      height: 42,
      width: 120,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: secondaryColor.withOpacity(0.5)),
      ),
      child: Center(
          child: Text(
        'Share',
        style: style2.copyWith(fontSize: 13),
      )),
    ),
  );
}
