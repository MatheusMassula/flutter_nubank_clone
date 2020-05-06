import 'package:flutter/material.dart';
import 'package:flutter_nubank_clone/widgets/card_footer.dart';
import 'package:flutter_nubank_clone/widgets/card_header.dart';

class ServiceCard extends StatelessWidget {
  final CardHeader header;
  final Widget content;
  final CardFooter footer;
  final List<Positioned> children;

  const ServiceCard({
    Key key,
    @required this.header,
    @required this.content,
    @required this.footer,
    this.children
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    List<Widget> stackContent = [
      Align(
        alignment: Alignment.topLeft,
        child: header,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: (_screenSize.height * 0.4) * 0.13),
          child: content,
        ),
      )
    ];

    if(children != null) {
      stackContent.addAll(children);
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: _screenSize.height * 0.4,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: stackContent,
              )
            ),
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
      child: footer
    );
  }
}