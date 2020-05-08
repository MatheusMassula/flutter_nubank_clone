import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nubank_clone/widgets/card_footer.dart';
import 'package:flutter_nubank_clone/widgets/card_header.dart';
import 'package:flutter_nubank_clone/widgets/fast_action_card.dart';
import 'package:flutter_nubank_clone/widgets/service_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isExpanded = false;
  bool _isAccountAmoutVisible = false;
  List<Widget> _serviceList;
  List<FastCardData> _fastActionList;

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

    _fastActionList = [
      FastCardData(
        icon: Icons.credit_card,
        text: 'Cartão virtual'
      ),
      FastCardData(
        icon: Icons.monetization_on,
        text: 'Transferir'
      ),
      FastCardData(
        icon: Icons.forum,
        text: 'Cobrar'
      ),
      FastCardData(
        icon: Icons.receipt,
        text: 'Pagar'
      ),
      FastCardData(
        icon: Icons.lock_open,
        text: 'Bloquear cartão'
      ),
      FastCardData(
        icon: Icons.tune,
        text: 'Ajustar limite'
      ),
      FastCardData(
        icon: Icons.person_add,
        text: 'Indicar amigos'
      ),
      FastCardData(
        icon: Icons.phone_iphone,
        text: 'Recarga de celular'
      ),
      FastCardData(
        icon: Icons.attach_money,
        text: 'Empréstimo'
      ),
      FastCardData(
        icon: Icons.add,
        text: 'Depositar'
      ),
      FastCardData(
        icon: Icons.live_help,
        text: 'Me ajuda'
      ),
      FastCardData(
        icon: Icons.reorder,
        text: 'Organizar atalhos'
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF76309c),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _buildSettingsSection(),
          _buildServicesSection(),
          _buildFastActionsSection()
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
      backgroundColor: Color(0xFF76309c),
      children: List<Widget>.generate(9, (index) {
        return Text('data $index');
      }).toList(),
    );
  }

  Container _buildServicesSection() {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.67,
      width: 300,
      margin: const EdgeInsets.all(16.0),
      child: ListView(
        children: _serviceList,
      ),
    );
  }

  Container _buildFastActionsSection() {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.15,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _fastActionList.map((shortCutItem) {
          return Padding(
            padding: EdgeInsets.only(left: shortCutItem.icon == _fastActionList[0].icon ? 16.0 : 0, right: shortCutItem.icon == _fastActionList[_fastActionList.length - 1].icon ? 16.0 : 0),
            child: FastAction(
              icon: shortCutItem.icon,
              text: shortCutItem.text
            ),
          );
        }).toList()
      ),
    );
  }
}

class FastCardData {
  final IconData icon;
  final String text;

  FastCardData({
    @required this.icon,
    @required this.text,
  });
}