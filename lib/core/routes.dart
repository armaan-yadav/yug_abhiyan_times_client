import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();

  Future<dynamic> push(Widget widget, BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  Future<dynamic> pushAndRemoveUntil(Widget widget, BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (route) => false);
  }
}
