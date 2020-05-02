import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      backgroundColor: const Color(0xFF76309c),
      body: ListView(
        children: <Widget>[
          _buildSettingsSection(),
          _buildServicesSection(),
          _buildCommonActionsSection()
        ],
      )
    );
  }

  ExpansionTile _buildSettingsSection() {
    return ExpansionTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 40,
                width: 40,
                child: Image.asset(
                  'assets/images/nulogo.png',
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: const Text(
                  'Matheus',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
            ],
          ),
          Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white,
          )
        ]
      ),
      trailing: Container(height: 0, width: 0),
      backgroundColor: Color(0xFF76309c),
      children: List<Widget>.generate(9, (index) {
        return Text('data $index');
      }).toList(),
    );
  }

  Container _buildServicesSection() {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.7,
      width: 300,
      margin: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ),
    );
  }

  Container _buildCommonActionsSection() {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.2,
      width: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ),
    );
  }
}