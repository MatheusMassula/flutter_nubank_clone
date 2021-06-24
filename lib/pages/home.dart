import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nubank_clone/widgets/card_footer.dart';
import 'package:flutter_nubank_clone/widgets/card_header.dart';
import 'package:flutter_nubank_clone/widgets/menu_item.dart';
import 'package:flutter_nubank_clone/widgets/service_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isExpanded = false;
  bool _isAccountAmoutVisible = false;
  List<Widget> _serviceList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _serviceList = [ //TODO: move it to init state
      ServiceCard(
        header: CardHeader(icon: Icons.credit_card, title: 'Crartão de crédito'),
        content: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildCreditCardServiceContent(),
          ),
        ),
        footer: CardFooter(icon: Icons.laptop_mac, text: 'Compra mais recente em Logo Ali Empreencimento no valor de R\$ 3.262,16'),
        children: [
          Positioned(
            right: 0,
            height: MediaQuery.of(context).size.height * 0.3, //TODO: Improve how to set this value, it should be the card height less the footer height
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
        ],
      ),
      ServiceCard(
        header: CardHeader(icon: Icons.monetization_on, title: 'Conta'),
        content: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildAccountServiceContent(),
          ),
        ),
        footer: CardFooter(icon: Icons.credit_card, text: 'Compra em Ambev de R\$ 100,00 no débito ontem'),
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 32.0),
                child: IconButton(
                  icon: Icon(_isAccountAmoutVisible ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isAccountAmoutVisible = !_isAccountAmoutVisible;
                    });
                  }
                ),
              ),
            )
          )
        ],
      ),
      ServiceCard(
        header: CardHeader(icon: Icons.card_giftcard, title: 'Rewards'),
        content: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildRewardsServiceContent(),
          ),
        ),
        footer: CardFooter(icon: Icons.fastfood, text: 'Apagar compra de R\$ 60,00 em Restaurante Give Me Food com 6.000pts'),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF7612c6),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _buildSettingsSection(),
          _buildServicesSection(),
          _buildMenuItems()
        ],
      )
    );
  }

  List<Widget> _buildCreditCardServiceContent() {
    return [
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
    ];
  }

  List<Widget> _buildAccountServiceContent() {
    List<Widget> result = [];

    result.add(Text('Saldo dinponível', style: TextStyle(color: Colors.grey)));

    if(_isAccountAmoutVisible) {
      result.add(Text('R\$ 1.258,38', style: TextStyle(fontSize: 35)));
    }
    else {
      result.add(
        Container(
          height: 42,
          width: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey.shade200,
                Colors.grey.shade100
              ]
            ),
          ),
        )
      );
    }

    return result;
  }

  List<Widget> _buildRewardsServiceContent() {
    return [
      RichText(
        text: TextSpan(
          text: '12.749 ',
          style: TextStyle(color: const Color(0xFF76309c), fontWeight: FontWeight.bold, fontSize: 35),
          children: [
            TextSpan(
              text: 'pts',
              style: TextStyle(color: const Color(0xFF76309c), fontWeight: FontWeight.w300, fontSize: 35)
            )
          ]
        ),
      ),
      RichText(
        text: TextSpan(
          text: 'Você acumulou ',
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: '3.999 pontos ',
              style: TextStyle(color: const Color(0xFF76309c))
            ),
            TextSpan(
              text: 'nos \núltimos 30 dias'
            )
          ]
        )
      )
    ];
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
      backgroundColor: Color(0xFF7612c6),
      children: List<Widget>.generate(9, (index) {
        return index.isEven ?
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 8.0, 16.0, 8.0),
              child: Icon(
                Icons.mail_outline,
                color: Colors.white,
              ),
            ),
            Text(
              'Menu number $index',
              style: TextStyle(color: Colors.white),
            )
          ],
        ) : 
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Divider(color: Colors.white,),
        );
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

  Widget _buildMenuItems() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuItem(
                  onTap: () {
                    print('Depositar was taped');
                  },
                  icon: Icons.input_rounded,
                  text: 'Depositar',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuItem(
                  onTap: () {
                    print('Tranferir was taped');
                  },
                  icon: Icons.outbond_outlined,
                  text: 'Tranferir',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuItem(
                  onTap: () {
                    print('Depositar was taped');
                  },
                  icon: Icons.input_rounded,
                  text: 'Depositar',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuItem(
                  onTap: () {
                    print('Tranferir was taped');
                  },
                  icon: Icons.outbond_outlined,
                  text: 'Tranferir',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuItem(
                  onTap: () {
                    print('Depositar was taped');
                  },
                  icon: Icons.input_rounded,
                  text: 'Depositar',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuItem(
                  onTap: () {
                    print('Tranferir was taped');
                  },
                  icon: Icons.outbond_outlined,
                  text: 'Tranferir',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}