import 'package:flutter/material.dart';
import 'package:market_satis/functions/Temel.dart';
import 'package:market_satis/models/defo.dart';
import 'package:market_satis/services/defo_api.dart';

import 'package:market_satis/views/temelWidget.dart';
import 'package:market_satis/widgets/EvirTextFDigits.dart';
import 'package:market_satis/widgets/EvirTextField.dart';
import 'package:market_satis/widgets/RowEvir2Button.dart';

class defo extends StatefulWidget {
  @override
  _defoState createState() => _defoState();
}

class _defoState extends temelWidget {
  //Değişkenler
  //Veri veri;
  //String Tc;
  String barkod,aciklama;
  int adet;

  //Tanımlar
  @override
  Widget build(BuildContext context) {
    this.veriSet(context);
    //veri = ModalRoute.of(context).settings.arguments;

    this.set(baslik:" Defo ",govde: Column(
    children: [
      //Barkod
      EvirTextFDigits(labelText:"Barkod:",onChanged: (text)=>barkodAl(text),),

      //Adet
      EvirTextFDigits(labelText: "Adet:",onChanged: (text)=>adetAl(text),),

      //Açıklama
      EvirTextField(labelText: "Açıklama:",maxLines: 15, onChanged: (text)=>aciklamaAl(text),),

      //Butonlar
      RowEvir2Button(text1: "Kaydet",text2: "İptal",onPressed1: ()=>kaydet(),onPressed2: ()=>Navigator.pop(context,true),),


    ],)
    );

    return super.build(context);

  }

  barkodAl(String text) {
    print(text);
    this.barkod=text;
  }

  adetAl(String text) {
    this.adet=int.parse(text);
  }

  aciklamaAl(String text) {
    this.aciklama=text;
  }

  kaydet() {

    if(barkod==null&&adet==null&&aciklama==null) {
      Temel.hata("Lütfen istenilen her alanı eksik siz ve tam doldurunuz", this.context);
      return;
    }
    if(barkod!=""&&adet!=0&&aciklama!=""){
      Defo defo = Defo(personelID: this.veri.id,barkod: barkod,adet: adet,aciklama: aciklama);
      DefoApi.add(defo).then((value)=>sonuc(value));
    }else{
      print("geldi");
      Temel.hata("Lütfen istenilan her alanı eksik siz ve tam doldurunuz", this.context);
    }
  }

  sonuc(int value) {
    if(value == 1){
      Temel.iyison("İşlem başarıyla gerçekleşti", this.context);
    }
    else if (value == -1){
      Temel.hata("Ardığınız ürün yok veya sayısı az \n Not: Bağlantınız yoksada bu mesajı görürsünüz ", this.context);
    }
    else{
      Temel.yukleniyor("Yükleniyor...", this.context);
    }
  }
}
