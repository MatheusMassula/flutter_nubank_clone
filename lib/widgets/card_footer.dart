import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardFooter({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(icon),
          ),
          Expanded(
            child: Text(
              text,
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.keyboard_arrow_right),
          )
        ],
      )
    );
  }
}