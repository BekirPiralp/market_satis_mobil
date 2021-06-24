import 'package:flutter/material.dart';

import 'EvirExpPad.dart';

/*class EvirKutuText extends StatefulWidget {
  String text;
  int flex;
  EvirKutuText(this.text,{Key key,this.flex}) : super(key: key);

  @override
  _EvirKutuTextState createState() => _EvirKutuTextState(text,flex: flex);
}*/

class EvirKutuText extends StatelessWidget {
  String text;
  int flex;
  EvirKutuText(this.text,{Key key,this.flex}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return EvirExpPad(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white54,
          border: Border.all(
            color: Colors.amber,
            width: 5,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(text,maxLines: 10,),
      ),
    );
  }
}
