import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nubank_clone/widgets/service_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isExpanded = false;
  List<Widget> _serviceList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _serviceList = [ //TODO: move it to init state
      ServiceCard(
        topIcon: Icons.credit_card,
        bottomIcon: Icons.laptop_mac,
        bottomText: 'Compra mais recente em Logo Ali Empreencimento no valor de R\$ 3.262,16',
        child: _buildServiceSummary(
          header: _buildServiceCardHeader(icon: Icons.credit_card, text: 'Crartão de crédito'),
          summary: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  'FATURA ATUAL',
                  style: TextStyle(color: const Color(0xff51b6c5))
                ),
                RichText(
                  text: TextSpan(
                    text: 'R\$ ',
                    style: TextStyle(color: const Color(0xff51b6c5),fontSize: 35),
                    children: <TextSpan>[
                      TextSpan(text: '1.490', style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff51b6c5), fontSize: 35)),
                      TextSpan(text: ',04', style: TextStyle(color: const Color(0xff51b6c5), fontSize: 35)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Limite disponível ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: 'R\$ 0,00', style: TextStyle(color: const Color(0xffa8c850),fontWeight: FontWeight.bold))
                    ]
                  ),
                ),
              ],
            ),
          ),
          children: [
            Positioned(
              right: 0,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 10,
                      color: const Color(0xfff19e39),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 10,
                      color: const Color(0xff52b8c5),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 10,
                      color: const Color(0xffa8c850),
                    )
                  )
                ],
              )
            )
          ]
        ),
      ),
      ServiceCard(
        topIcon: Icons.credit_card,
        bottomIcon: Icons.credit_card,
        bottomText: 'Compra em Ambev de R\$ 100,00 no débito ontem',
        child: _buildServiceSummary(
          header: _buildServiceCardHeader(icon: Icons.monetization_on, text: 'Conta'),
          summary: Text('data')
        ),
      ),
      ServiceCard(
        topIcon: Icons.credit_card,
        bottomIcon: Icons.fastfood,
        bottomText: 'Apagar compra de R\$ 60,00 em Restaurante Give Me Food com 6.000pts',
        child: _buildServiceSummary(
          header: _buildServiceCardHeader(icon: Icons.card_giftcard, text: 'Rewards'),
          summary: Text('data')
        ),
      ),
    ];
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      backgroundColor: const Color(0xFF76309c),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold
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
        children: _serviceList,
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

  Row _buildServiceCardHeader({@required IconData icon, @required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 16, 32),
          child: Icon(icon),
        ),
        Text(text),
        Expanded(child: Container(height: 0, width: 0))
      ],
    );
  }

  Stack _buildServiceSummary({@required Widget header, @required Widget summary, List<Positioned> children}) {
    List<Widget> content = [
      Align(
        alignment: Alignment.topLeft,
        child: header,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: summary,
      )
    ];

    if(children != null) {
      content.addAll(children);
    }

    return Stack(
      children: content,
    );
  }
}