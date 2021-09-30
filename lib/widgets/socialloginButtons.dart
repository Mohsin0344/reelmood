import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:realmood/utils/constant.dart';

facebookButton(function){
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.withOpacity(0.1),
    ),
    child: Center(
      child: IconButton(
          icon: FaIcon(FontAwesomeIcons.facebookF,color: secondaryColor,size: 22,),
          onPressed: function,
      ),
    ),
  );
}

googleButton(function){
  return Container(
    height:50,
    width: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.withOpacity(0.1),
    ),
    child: Center(
      child: IconButton(
          icon: FaIcon(FontAwesomeIcons.google,color: secondaryColor,),
          onPressed: function,
      ),
    ),
  );
}

appleButton(function){
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.withOpacity(0.1),
    ),
    child: Center(
      child: IconButton(
          icon: FaIcon(FontAwesomeIcons.apple,color: secondaryColor,),
          onPressed: function,
      ),
    ),
  );
}