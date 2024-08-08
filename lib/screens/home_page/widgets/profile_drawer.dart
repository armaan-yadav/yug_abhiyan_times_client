import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 70 / 100,
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(),
            ),
          ),
        ),
      ),
    );
  }
}
