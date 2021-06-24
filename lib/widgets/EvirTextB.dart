import 'package:flutter/material.dart';
import 'package:market_satis/widgets/EvirText.dart';


/*class EvirTextB extends StatefulWidget {
  String text;
  int flex;
  double fontSize;
  EvirTextB({Key key,this.text,this.flex,this.fontSize}) : super(key: key);

  @override
  _EvirTextBState createState() => _EvirTextBState(text,flex: flex);
}*/

class EvirTextB extends StatelessWidget {
  String text;
  int flex;
  double fontSize;
  EvirTextB({this.text,Key key,this.flex,this.fontSize}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return EvirText(text: text,
    fontSize: fontSize,
    fontWeight: FontWeight.bold,);
  }
}
