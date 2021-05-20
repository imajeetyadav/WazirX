import 'package:flutter/material.dart';
import '../widget/header.dart';

class AlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Header(
            headerText: 'My Alert',
          ),
        ],
      ),
    );
  }
}
