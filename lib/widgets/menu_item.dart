import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const MenuItem({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          height: 100,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0, top: 16.0),
                child: Icon(
                  icon,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, bottom: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}