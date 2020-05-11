import 'package:flutter/material.dart';

class QuickAction extends StatelessWidget {
  final IconData icon;
  final String text;

  const QuickAction({
    Key key,
    @required this.icon,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    double _size = MediaQuery.of(context).size.height * 0.13;

    return FlatButton(
      padding: EdgeInsets.only(left: 4.0, right: 4.0),
      onPressed: () {

      },
      child: Container(
        height: _size,
        width: _size,
        decoration: BoxDecoration(
          color: const Color(0xff8c4ca7),
          border: Border.all(
            color: const Color(0xff8c4ca7),
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}