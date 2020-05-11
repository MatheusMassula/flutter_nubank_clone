import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nubank_clone/widgets/card_footer.dart';
import 'package:flutter_nubank_clone/widgets/card_header.dart';
import 'package:flutter_nubank_clone/widgets/quick_action_card.dart';
import 'package:flutter_nubank_clone/widgets/service_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isExpanded = false;
  bool _isAccountAmoutVisible = false;
  List<Widget> _serviceList;
  List<QuickActionData> _fastActionList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          _buildQuickActionsSection()
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
      onExpansionChanged: (expasion) {
        setState(() {
          _isExpanded = expasion;
        });
      },
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

    _serviceList = [
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

    return Container(
      height: screenSize.height * 0.67,
      width: 300,
      margin: const EdgeInsets.all(16.0),
      child: ListView(
        children: _serviceList,
      ),
    );
  }

  Container _buildQuickActionsSection() {
    Size _screenSize = MediaQuery.of(context).size;

    _fastActionList = [
      QuickActionData(
        icon: Icons.credit_card,
        text: 'Cartão virtual'
      ),
      QuickActionData(
        icon: Icons.monetization_on,
        text: 'Transferir'
      ),
      QuickActionData(
        icon: Icons.forum,
        text: 'Cobrar'
      ),
      QuickActionData(
        icon: Icons.receipt,
        text: 'Pagar'
      ),
      QuickActionData(
        icon: Icons.lock_open,
        text: 'Bloquear cartão'
      ),
      QuickActionData(
        icon: Icons.tune,
        text: 'Ajustar limite'
      ),
      QuickActionData(
        icon: Icons.person_add,
        text: 'Indicar amigos'
      ),
      QuickActionData(
        icon: Icons.phone_iphone,
        text: 'Recarga de celular'
      ),
      QuickActionData(
        icon: Icons.attach_money,
        text: 'Empréstimo'
      ),
      QuickActionData(
        icon: Icons.add,
        text: 'Depositar'
      ),
      QuickActionData(
        icon: Icons.live_help,
        text: 'Me ajuda'
      ),
      QuickActionData(
        icon: Icons.reorder,
        text: 'Organizar atalhos'
      ),
    ];

    return Container(
      height: _screenSize.height * 0.15,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _fastActionList.map((shortCutItem) {
          return Padding(
            padding: EdgeInsets.only(left: shortCutItem.icon == _fastActionList[0].icon ? 16.0 : 0, right: shortCutItem.icon == _fastActionList[_fastActionList.length - 1].icon ? 16.0 : 0),
            child: QuickAction(
              icon: shortCutItem.icon,
              text: shortCutItem.text
            ),
          );
        }).toList()
      ),
    );
  }
}

class QuickActionData {
  final IconData icon;
  final String text;
  final Function() onTap;

  QuickActionData({
    @required this.icon,
    @required this.text,
    this.onTap
  });
}