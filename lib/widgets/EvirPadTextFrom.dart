import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EvirExpPad.dart';

class EvirPadTextFrom extends StatefulWidget{
  String labelText;
  String hintText;
  int flex,maxLength;
  void Function(String) onChanged;
  EvirPadTextFrom({Key key,this.flex,this.labelText="",this.hintText="",this.maxLength,this.onChanged}):super(key: key);

  @override
  State<EvirPadTextFrom> createState() =>_EvirPadTextFrom();



}

class _EvirPadTextFrom extends State<EvirPadTextFrom>{
  @override
  Widget build(BuildContext context) {
    return EvirExpPad(
      flex: widget.flex,
      child:TextFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),

        maxLines: 1,
        maxLength: widget.maxLength,
        onChanged:(String a){
          //print(a);
          /*İşe yarıyor*/
          setState((){widget.onChanged(a);});
        },
      ) ,
    );
  }

}