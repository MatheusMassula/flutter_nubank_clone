import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final IconData topIcon;
  final IconData bottomIcon;
  final String bottomText;
  final Widget child;

  const ServiceCard({
    Key key,
    @required this.topIcon,
    @required this.bottomIcon,
    @required this.bottomText,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: _screenSize.height * 0.4,
        child: Column(
          children: <Widget>[
            Expanded(child: child),
            _buildBottom(_screenSize)
          ],
        ),
      ),
    );
  }

  Container _buildBottom(Size _screenSize) {
    return Container(
      height: _screenSize.height * 0.1,
      color: Color(0xfff7f7f7),
      child: FlatButton(
        onPressed: () {
          
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(bottomIcon),
            ),
            Expanded(
              child: Text(
                bottomText,
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.keyboard_arrow_right),
            )
          ],
        )
      ),
    );
  }
}