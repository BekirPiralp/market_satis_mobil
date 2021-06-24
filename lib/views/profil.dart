import 'package:flutter/material.dart';
import 'package:market_satis/views/temelWidget.dart';
import 'package:market_satis/widgets/EvirKutuText.dart';
import 'package:market_satis/widgets/TextBold.dart';
import 'package:market_satis/widgets/TextP.dart';

class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}

class _profilState extends temelWidget {

  //tanımlar
  @override
  Widget build(BuildContext context) {
    this.veriSet(context);
    this.tc = veri.Tc;

    this.set(baslik: "Profil",
    govde: Column(
      children: <Widget>[
        //Temelbilgi
        Row(
          children: [
            Column(
              children: [
                TextBold("Ad:",),
                TextBold("Soyad:",),
                TextBold("Cinsiyet:",),
                TextBold("Telefon:",),
                TextBold("Email:",),
                TextBold("Yetki:",),
              ],
            ),
            Column(
              children: [
                TextP("${veri.Ad}",),
                TextP("${veri.Soyad}",),
                TextP("${veri.Cinsiyet}",),
                TextP("${veri.Telefon}",),
                TextP("${veri.Email}",),
                TextP("${veri.Yetki}",),
              ],
            ),
          ],
        ),
        //Adress
        TextBold("Adress",),
        EvirKutuText("${veri.Aciklama}".toString(),),
        //Ekbilgi
        TextBold("Ek bilgi",),
        EvirKutuText("${veri.EkBilgi}".toString(),),
      ],
    ));

    return super.build(context);
  }
}
