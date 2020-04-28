import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76309c),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: <Widget>[
                ExpansionTile(
                  title: Center(
                    child: const Text(
                      'NuBank + Username',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ),
                  trailing: Container(height: 0, width: 0),
                  backgroundColor: Color(0xFF76309c),
                  children: List<Widget>.generate(9, (index) {
                    return Text('data $index');
                  }).toList(),
                )
              ],
            ),
          ),
        ]
      )
    );
  }
}