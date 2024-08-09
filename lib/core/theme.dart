import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
);

final BoxDecoration bottomShadowEffect =
    BoxDecoration(color: Colors.white, boxShadow: [
  BoxShadow(
    color: Colors.black.withOpacity(.1),
    spreadRadius: 1,
    blurRadius: 6,
    offset: const Offset(0, 2),
  ),
]);
