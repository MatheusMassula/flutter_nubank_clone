import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const CardHeader({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 16, 32),
          child: Icon(icon),
        ),
        Text(title),
        Expanded(child: Container(height: 0, width: 0))
      ],
    );
  }
}