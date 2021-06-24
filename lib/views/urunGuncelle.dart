import 'package:flutter/material.dart';
import 'package:market_satis/functions/Temel.dart';
import 'package:market_satis/models/urun.dart';
import 'package:market_satis/services/urun_service.dart';
import 'package:market_satis/widgets/EvirText.dart';
import 'package:market_satis/widgets/EvirTextFDouble.dart';
import 'package:market_satis/widgets/RowEvir2Button.dart';
import 'package:market_satis/views/temelWidget.dart';
import 'package:market_satis/widgets/EvirTextFDigits.dart';

class urunGuncelle extends StatefulWidget {
  @override
  _urunGuncelleState createState() => _urunGuncelleState();
}

class _urunGuncelleState extends temelWidget {
  //Değişkenler
  Urun urun = Urun();
  UrunService service = UrunService();
  //Tanımlar
  @override
  Widget build(BuildContext context) {
    this.veriSet(context);
    tc = veri.Tc;

    this.set(baslik:"Ürün Güncelle",govde: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Barkod
        EvirTextFDigits(labelText:"Barkod:",onChanged: (text)=>barkodal(text),),

        //Fiyat
        EvirTextFDouble(labelText: "Fiyat:",onChanged: (text)=>fiyatal(text)),

        //Adet
        EvirTextFDigits(labelText: "Adet:",onChanged: (text)=>adetal(text)),

        //Butonlar
        RowEvir2Button(text1: "Kaydet",text2: "İptal",onPressed1: ()=>kaydet(),onPressed2: ()=>Navigator.pop(context,true),),

        //Uyarı
        EvirText(text:"Not: urun sayısını tamamen değiştirir ekleme yapmaz.",fontSize: 20,fontWeight: FontWeight.w400,),
      ],
    ) );

    return super.build(context);
  }

  barkodal(String text) {
    urun.barkod=text!=null&&text!=""?text:"";
    if(urun.barkod!=""){
      service.getir(urun.barkod).then((value)=>goster(value));
    }
  }

  fiyatal(String text) {
    urun.fiyat=text!=null&&text!=""?double.parse(text):-1;
  }

  adetal(String text) {
    urun.adet=text!=null&&text!=""?int.parse(text):-1;
  }

  kaydet() {
    service.guncelle(urun.barkod,adet: urun.adet,fiyat: urun.fiyat).then((value)=>sonuc(value));
  }

  sonuc(int value) {
    switch(value){
      case 1:
        Temel.iyison("İşlem başarılı", context);
        break;
      case 0:
        Temel.hata("Adet veya Fiyattan enaz birini ve barkodu giriniz", context);
        break;
      case -1:
        Temel.hata("İşlem başarısız", context);
        break;
      default:
        Temel.hata("Bilin meyen bir hata oluştu. Lütfen internetinizi kontrol edin", context);
        break;
    }
  }

  goster(Urun value) {
    if(value!=null){
      showDialog(context: context, builder: (context){
       return AlertDialog(
          title: Text("Barkod : "+value.barkod),
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Marka : "+value.marka),
                Text("Ad : "+value.ad),
                Text("Adet :"+value.adet.toString()+"   Fiyat :"+value.fiyat.toString()+" TL"),
                Text("Üretim yeri : "+value.uretimYeri)
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text("Tamam")),
          ],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),bottomLeft: Radius.circular(80) )),

        );
      });
    }
  }


}
