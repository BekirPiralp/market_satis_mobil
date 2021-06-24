import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_satis/functions/Temel.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';

class Giris extends Temel {

Widget donustur (Widget widget){
  return EvirExpPad(child: widget,flex: 1);
}


}