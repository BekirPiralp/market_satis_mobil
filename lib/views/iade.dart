import 'package:flutter/material.dart';
import 'package:market_satis/functions/Temel.dart';
import 'package:market_satis/models/iade.dart';
import 'package:market_satis/services/iade_api.dart';
import 'package:market_satis/views/temelWidget.dart';
import 'package:market_satis/widgets/EvirTextFDigits.dart';
import 'package:market_satis/widgets/EvirTextField.dart';
import 'package:market_satis/widgets/RowEvir2Button.dart';

class iade extends StatefulWidget {
  @override
  _iadeState createState() => _iadeState();
}

class _iadeState extends temelWidget {
  Iade _iade = Iade();
  //Tanımlar
  @override
  Widget build(BuildContext context) {
    this.veriSet(context);
    this.tc = veri.Tc;
    this.set(baslik: " İade ",
    govde: Column(
      children: [
        //Fiş no
        EvirTextFDigits(labelText: "Fiş no:",onChanged: (text)=> fis(text),),

        //Barkod
        EvirTextFDigits(labelText: "Barkod:",onChanged: (text)=>barkod(text)),

        //Adet
        EvirTextFDigits(labelText: "Adet:",onChanged: (text)=>adet(text)),

        //Açıklama
        EvirTextField(labelText: "Açıklama:",maxLines: 13,onChanged: (text)=>aciklama(text)),

        //Butonlar
        RowEvir2Button(text1: "Kaydet",text2: "İptal",onPressed1: ()=>kaydet(),onPressed2: ()=>Navigator.pop(context,true),),

      ],
    ));

    return super.build(context);
  }

  fis(String text) {
    _iade.fis=text!=null?text:"";
  }

  barkod(String text) {
    _iade.barkod=text!=null?text:"";
  }

  adet(String text) {
    _iade.adet=text!=null?int.parse(text):0;
  }

  aciklama(String text) {
    _iade.aciklama=text!=null?text:"";
  }

  kaydet() async {

    _iade.personelID=this.veri.id;
    await IadeApi.add(_iade).then((value)  {

        switch(value){
         case 1:
           Temel.iyison("İşleminiz başarıyla gerçekleşti", context);
           break;
         case 0:
           Temel.yukleniyor("Yükleniyor...", context);
           break;
         case -1:
           Temel.hata("Lütfen değerleri eksiksiz giriniz", context);
           break;
         case -2:
           Temel.hata("Böyle bir satış bulunamadı lütfen bilgileri kontrol ediniz", context);
           break;
         case -3:
           Temel.hata("Yanlış değer girdiniz", context);
           break;
          case -4:
            Temel.hata("Yükleme esnasında hata oluştu. İnterneti kontrol edin", context);
            break;
         default:
           Temel.hata("Bilinmeyen bir sebepten hata oldu. İnterneti kontrol ediniz", context);
           break;
       }
     });
  }
}
