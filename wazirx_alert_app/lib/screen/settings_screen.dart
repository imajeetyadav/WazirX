import 'package:flutter/material.dart';
import '../widget/header.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Header(
            headerText: 'Settings',
          ),
        ],
      ),
    );
  }
}
