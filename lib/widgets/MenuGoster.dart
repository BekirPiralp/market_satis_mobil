import 'package:flutter/material.dart';
import '../functions/Temel.dart';

import '../Veri.dart';
import '../views/defo.dart';
import '../main.dart';
import '../views/giris.dart';
import '../views/hakkinda.dart';
import '../views/iade.dart';
import '../views/profil.dart';
import '../views/sifreDegistir.dart';
import '../views/urunEkle.dart';
import '../views/urunGuncelle.dart';

/*class MenuGoster extends StatefulWidget {
  MenuGoster({Key key}) : super(key: key);
  @override
  _MenuGosterState createState() => _MenuGosterState();
}*/

class MenuGoster extends StatelessWidget {
  MenuGoster({Key key}) : super(key: key);

  Temel temel = new Temel();
  Veri veri;

  @override
  Widget build(BuildContext context) {

    veri =ModalRoute.of(context).settings.arguments;

    //Açılır menu ye eleman ekleme
    temel.menuTemizle();
    temel.menuEkle(
        baslik: "Satış", veri: veri,context: context, fonksiyon: (context) => giris());
    temel.menuEkle(baslik: "İade", veri: veri,context: context, fonksiyon: (context) => iade());
    temel.menuEkle(
        baslik: "Ürün Ekle", veri: veri,context: context, fonksiyon: (context) => urunEkle());
    temel.menuEkle(
        baslik: "Ürün Güncelle",
        veri: veri,
        context: context,
        fonksiyon: (context) => urunGuncelle());
    temel.menuEkle(baslik: "Defo", veri: veri,context: context, fonksiyon: (context) => defo());
    temel.menuEkle(
        baslik: "Profil", veri: veri,context: context, fonksiyon: (context) => profil());
    temel.menuEkle(
        baslik: "Şifre Değiştir",
        veri: veri,
        context: context,
        fonksiyon: (context) => sifreDegistir());
    temel.menuEkle(
        baslik: "Hakkında", veri: veri,context: context, fonksiyon: (context) => hakkinda());
    temel.menuEkle(baslik: "Çıkış",veri:veri,context: context, fonksiyon: (context)=> MyApp());

    return temel.menu(context);
  }
}
