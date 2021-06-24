import 'package:flutter/material.dart';
import 'package:market_satis/functions/Temel.dart';
import 'package:market_satis/models/urun.dart';
import 'package:market_satis/services/urun_service.dart';
import 'package:market_satis/widgets/EvirTextFDouble.dart';
import 'package:market_satis/widgets/EvirTextField.dart';
import 'package:market_satis/widgets/RowEvir2Button.dart';
import 'package:market_satis/views/temelWidget.dart';
import 'package:market_satis/widgets/EvirTextFDigits.dart';

class urunEkle extends StatefulWidget {
  @override
  _urunEkleState createState() => _urunEkleState();
}

class _urunEkleState extends temelWidget {
  //Tanımlar
  Urun urun= Urun();
  UrunService service = UrunService();
  @override
  Widget build(BuildContext context) {
    this.veriSet(context);
    tc = veri.Tc;
    this.set(baslik:"Ürün Ekle",govde: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Barkod
        EvirTextFDigits(labelText: "Barkod:",onChanged: (a)=>BarkodAl(a),),

        //Ad
        EvirTextField(labelText: "Ad:",onChanged: (a)=>adAl(a)),

        //Marka
        EvirTextField(labelText: "Marka:",onChanged: (a)=>MarkaAl(a)),

        //Üretim yeri
        EvirTextField(labelText: "Üretim Yeri:",onChanged: (a)=>UretAl(a)),

        //Fiyat
        EvirTextFDouble(labelText: "Fiyat:",onChanged: (a)=>FiyatAl(a)),

        //Adet
        EvirTextFDigits(labelText: "Adet:",onChanged: (a)=>AdetAl(a)),

        //Butonlar
        RowEvir2Button(text1: "Kaydet",text2: "İptal",onPressed1: ()=>kaydet(),onPressed2: ()=>Navigator.pop(context,true),),
      ],
    ) );

    return super.build(context);
  }

  BarkodAl(String a) {
    urun.barkod=a!=null&&a!=""?a:"";
  }

  adAl(String a) {
    urun.ad=a!=null&&a!=""?a:"";
  }

  MarkaAl(String a) {
    urun.marka=a!=null&&a!=""?a:"";
  }

  UretAl(String a) {
    urun.uretimYeri=a!=null&&a!=""?a:"";
  }

  FiyatAl(String a) {
    urun.fiyat=a!=null&&a!=""?double.parse(a):0;
  }

  AdetAl(String a) {
    urun.adet=a!=null&&a!=""?int.parse(a):0;
  }

  kaydet() {
    if(urun.ad!=""&&urun.adet!=-1&&urun.fiyat!=-1&&urun.uretimYeri!=""&&urun.marka!=""&&urun.barkod!=""){
      service.ekle(urun).then((value) => goster(value));
    }else{
      /*Girmesini beklemek manasında ....*/
      Temel.yukleniyor("Sizlerden istenilen verileri lütfen tam giriniz", context);
    }
  }

  goster(int value) {
    switch(value){
      case 1:
        Temel.iyison("İşlem başarıyla tamalandı", context);
        break;
      case -1:
        Temel.hata("Eklemeye çalıştığınız ürün sistemde mevcuttur.\nLütfen güncelleme işlemi yapınız.", context);
        break;
      default:
        Temel.yukleniyor("İnternet bağlantınızı lütfen kontrol ediniz", context);
        break;
    }
  }
}
