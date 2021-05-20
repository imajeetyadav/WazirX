import 'package:flutter/material.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  final headerText;
  const Header({
    Key key,
    @required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 4,
      ),
      child: Text(
        headerText,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
