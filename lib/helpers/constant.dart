import 'package:flutter/material.dart';

Color black = Colors.black87;
Color yellow = const Color(0xFFFFD700);
Color red = const Color(0xFFED6560);
Color teal = const Color(0xFF18A47C);
Color blue = Colors.blue;
Color white = Colors.white;
Color grey = Colors.grey;
const kColorFade = Color.fromARGB(255, 104, 97, 97);
const kColorGrey = Color(0xFFA3A3A3);

var kTextFieldDecoration = InputDecoration(
  border: const OutlineInputBorder(),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: yellow, width: 1.0),
  ),
  hintText: 'Enter your Message',
  labelStyle: const TextStyle(color: Colors.grey),
  hintStyle: const TextStyle(color: Colors.grey),
);
const currentUserRadius = BorderRadius.only(
  topLeft: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);
const otherUsersRadius = BorderRadius.only(
  topRight: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);
