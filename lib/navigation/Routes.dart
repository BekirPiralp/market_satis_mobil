
import 'package:flutter/cupertino.dart';
import 'package:market_satis/main/myHomePage.dart';

import '../views/defo.dart';
import '../views/giris.dart';
import '../views/hakkinda.dart';
import '../views/iade.dart';
import '../main.dart';
import '../views/profil.dart';
import '../views/sifreDegistir.dart';
import '../views/urunEkle.dart';
import '../views/urunGuncelle.dart';

class Routes{
  BuildContext context;
  var _routes ={
  '/main':(context) => MyHomePage(),
  '/hakkinda':(contex) => hakkinda(),
  '/giris':(context) => giris(),
  '/sifreDegistir':(context) => sifreDegistir(),
  '/profil':(context) => profil(),
  '/urunEkle':(context) => urunEkle(),
  '/urunGuncelle':(context) => urunGuncelle(),
  '/defo':(context) => defo(),
  '/iade':(context) => iade(),
  '/çıkış':(context) => MyApp(),
};
  String _initialRoute = "/";

  Routes(BuildContext context){
    this.context=context;
  }

  Map get (){
    return _routes;
  }

  String initialGet(){
    return _initialRoute;
  }

}


