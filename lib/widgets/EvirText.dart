import 'package:flutter/material.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';

/*class EvirText extends StatefulWidget {
  String text;
  int flex=1;
  double fontSize;
  FontWeight fontWeight;
  EvirText({Key key,this.text,this.fontWeight,this.flex,this.fontSize}) : super(key: key);

  @override
  _EvirTextState createState() => _EvirTextState(text,fontWeight: fontWeight,flex: flex,fontSize: fontSize);
}*/

//class _EvirTextState extends State<EvirText> {

class EvirText extends StatelessWidget {
  String text;
  int flex;
  double fontSize;
  FontWeight fontWeight;
  //_EvirTextState(text,{this.fontWeight,this.flex,this.fontSize}){
  EvirText({Key key,this.text,this.fontWeight,this.flex,this.fontSize}): super(key: key){
    //this.setState(() {
      this.text=text;
    //});
  }
  @override
  Widget build(BuildContext context) {
    return EvirExpPad(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
