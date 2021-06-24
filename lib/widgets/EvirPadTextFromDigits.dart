import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';

class EvirPadTextFromDigits extends StatelessWidget{
  String labelText;
  String hintText;
  int flex,maxLength;
  void Function(String) onChanged;
  EvirPadTextFromDigits({Key key,this.flex,this.labelText="",this.hintText="",this.maxLength,this.onChanged}):super(key: key);
  @override
  Widget build(BuildContext context) {
   return EvirExpPad(
     flex: flex,
     child:TextFormField(
       decoration: InputDecoration(
         labelText: labelText,
         hintText: hintText,
       ),

       maxLines: 1,
       maxLength: maxLength,
       keyboardType: TextInputType.number,
       inputFormatters: [
         FilteringTextInputFormatter.digitsOnly,
       ],
       onChanged:onChanged,
     ) ,
   );
  }

}