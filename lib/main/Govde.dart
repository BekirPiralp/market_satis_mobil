import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market_satis/models/pDetay.dart';
import 'package:market_satis/models/personel.dart';
import 'package:market_satis/models/sifre.dart';
import 'package:market_satis/services/pDetay_api.dart';
import 'package:market_satis/services/personel_api.dart';
import 'package:market_satis/services/sifre_api.dart';
import 'package:market_satis/services/urun_service.dart';
import 'package:market_satis/views/giris.dart';
import 'package:market_satis/views/hakkinda.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';
import 'package:market_satis/widgets/EvirPadTextFrom.dart';
import 'package:market_satis/widgets/EvirPadTextFromDigits.dart';
import 'package:market_satis/widgets/RowEvir2Button.dart';

import '../Veri.dart';

class Govde extends StatefulWidget {
  const Govde({Key key}) : super(key: key);

  @override
  _GovdeState createState() => _GovdeState();
}

class _GovdeState extends State<Govde> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EvirExpPad(child: Text(
          "Giriş yapabilmek için TC'nizi ve şifrenizi giriniz.",
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ), flex: 1,),

        EvirPadTextFromDigits(
          flex: 1,
          maxLength: 11,
          labelText: "TC kimlik no:",
          hintText: "Lütfen istenilen bilgiyi giriniz",
          onChanged: (text) {
            _tcAl(text);
            text = "";
          },
        ),

        EvirPadTextFrom(
          flex: 1,
          labelText: "Şifreniz:",
          hintText: "Lütfen istenilen bilgiyi giriniz",
          onChanged: (text) {
            _sifreAl(text);
          },
        ),

        RowEvir2Button(
          text1: "Giriş",
          text2: "Hakkında",
          onPressed1: () {
            _kontrol();
          },
          onPressed2: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_context) => hakkinda()));
          },
          onLongPress1: (){longPress1();},
          onTapDown1: (_){ilkBasma();} ,),

      ],
    );
  }


  String tc = "", sifre = "";
  bool buttonaktif=false;
  Veri veri=new Veri();
  /*Methodlar*/
  void _tcAl(String Text) {
    tc = Text;
    if (tc.length == 11) {
      buttonaktif = true;
    } else {
      buttonaktif = false;
    }
  }

  void _sifreAl(String text) {
    sifre = text;
  }

  void _kontrol() {
    Veri veri = new Veri();
    veri.Tc = this.tc;
    // Şifre kontrol mekanizması
    if (this.tc.length == 11 && buttonaktif) {
      tcSifreKontrol(context);
      //Navigator.pushNamed(context, '/giris',arguments: veri);
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => giris(),
          settings: RouteSettings(
            arguments: veri,
          ),
        ),
      );*/
    }
  }

  longPress1() async {

    await showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Dikkat"),
        content: Text(
            "Tuşa uzun bastığınız algılandı. Bilgilerinizi doğru girdiğinizden emin misiniz?"),
        //elevation: 24.0,
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("Evet")),

          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("Hayır")),
        ],
        //shape: CircleBorder() ,
      );
    });
  }

  ilkBasma() {
    if(buttonaktif){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Tc niz sistemden çekiliyor"),
        //veri tabanından çeker iken gözükecek
      ));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Tc'nizi tam giriniz 11 hane"),
      ));
    }
  }

  void tcSifreKontrol(BuildContext context) {
    PersonelApi.getPersonelTc(this.tc.trim()).then((yanit) {
      if(yanit.statusCode==200){
        List jsonYanit = json.decode(yanit.body);
        List<Personel>prsn = jsonYanit.map((birimveri) => Personel.jsondan(birimveri)).toList();

        if( prsn.isNotEmpty){
          sifreApi.getsifre(prsn[0].id).then(
              (response){
                if(response.statusCode==200){
                  List jsonSifreYanit = json.decode(response.body);
                  List<Sifre>sfre=jsonSifreYanit.map((e) => Sifre.jsondan(e)).toList();
                  if(sfre.isNotEmpty){
                    if(sfre[0].sifre.trim().compareTo(this.sifre.trim())==0){
                      veri.id=prsn[0].id;
                      veri.Tc=prsn[0].tc;
                      veri.Ad=prsn[0].ad;
                      veri.Soyad=prsn[0].soyad;
                      veri.Cinsiyet=prsn[0].cinsiyet;
                      veri.Sifre=sfre[0].sifre;
                      veri.Yetki=prsn[0].yetki? "Yönetici" : "Çalışan";
                      pDetayApi.getPersonelDetayPersonelId(prsn[0].id).then((value){
                        if(value.statusCode==200){
                          List abc = json.decode(value.body);
                          List<pDetay> detay = abc.map((e) => pDetay.jsondan(e)).toList();
                          if(detay.isNotEmpty){
                            veri.Telefon=detay[0].telefon;
                            veri.Email=detay[0].email;
                            veri.EkBilgi=detay[0].ekbilgi;
                            veri.Aciklama=detay[0].adress;
                          }else{
                            veri.Telefon="";
                            veri.Email="";
                            veri.EkBilgi="";
                            veri.Aciklama="";
                          }
                        }
                      });
                      git();
                    }else{
                      yanlis();
                    }
                  }else{
                    bekle();
                  }
                }else{
                 hata();
                }
              }
          );
        }else{
          bekle();
        }

      }else{
        hata();
      }
    });
  }

  void hata(){
    cati("Bir hata oluştu");
  }
  void yanlis(){
    cati("Yanlis Sifre girdiniz");
  }
  void bekle(){
    cati("Veriler bekleniyor yada\nKayıtlarda yok\nLütfen kontrol ediniz.");
  }
  void git(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => giris(),
        settings: RouteSettings(
          arguments: veri,
        ),
      ),
    );
  }
  void cati (String a){
    showDialog(context:context,builder: (context){
      return  AlertDialog(
        title: Text(a),
        content: CircularProgressIndicator(),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("Tamam")),
        ],
      );
    });
  }
}
