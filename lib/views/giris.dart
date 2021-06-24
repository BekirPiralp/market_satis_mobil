import 'dart:async';

import 'package:flutter/material.dart';
import 'package:market_satis/functions/Temel.dart';
import 'package:market_satis/models/fis.dart';
import 'package:market_satis/models/satis.dart';
import 'package:market_satis/models/urun.dart';
import 'package:market_satis/models/urunListeModel.dart';
import 'package:market_satis/services/fis_service.dart';
import 'package:market_satis/services/satis_servis.dart';
import 'package:market_satis/services/urun_service.dart';
import 'package:market_satis/views/temelWidget.dart';
import 'package:market_satis/widgets/EvirText.dart';
import 'package:market_satis/widgets/EvirTextB.dart';
import 'package:market_satis/widgets/EvirTextFDigits.dart';
import 'package:market_satis/widgets/RowEvir2Button.dart';

import 'package:market_satis/widgets/UrunGoster.dart';

class giris extends StatefulWidget {
  @override
  _girisState createState() => _girisState();
}

//class _girisState extends temelWidget<giris> {
class _girisState extends temelWidget {
  //Değişkenler
  //temelWidget temel=new temelWidget();

  String AdSoyad;
  double toplamFiyat = 27.2; // varsayılan
  int sayi = 15;
  DateTime suankiTarih = DateTime.now();
  bool kontrol = false;

  static List<Urunler> urunler = List<Urunler>();
  static Urun urun;
  static UrunService urunService = UrunService();
  int urunAdet = 0;
  String urunBarkod = "";

  static FisService fisService = FisService();
  static SatisServis satisServis = SatisServis();
  static Fis fis = null;
  static Satis satis = null;
  String fisNo="";

  //Fonksiyonlar
  zaman() {
    setState(() {
      suankiTarih = DateTime.now();
    });
  }

  //aşırı yüklemeler ve yazmalar
  @override
  Widget build(BuildContext context) {
    this.veriSet(context);

    AdSoyad = veri.Ad + "\t" + veri.Soyad;

    Timer(Duration(seconds: 1), () {
      this.setState(() {
        zaman();
      });
    });

    // _sayac.start();
    _girisState();

    this.set(
      baslik: "Hoşgeldiniz",
      govde: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  EvirTextB(text: "Tarih saat:",fontSize: 15,),
                  EvirTextB(text: "Ad Soyad:",fontSize: 15,),
                ],
              ),
              Column(
                children: [
                  //Text(suankiTarih.toString().substring(0, 19)),

                  EvirText(text:suankiTarih.toString().substring(0, 19),fontSize: 15,),

                  //Garip birşekilde zaman akmıyor şekilinde durmuş halde olma sıkıntısı aldım lakin sebebini anlayamadım.
                  // set Satet ile her değiştiğinde de Evir text te tekrar çidirdim ama daha denemedim
                  // widgetin kalıtımını StatelessWidget dan yapınca oldu başka şeyler de deneyeceğim
                  EvirText(text: this.AdSoyad,fontSize: 15,),
                ],
              ),
            ],
          ),
          Row(
            children: [
              EvirTextB(text: "Barkod:",fontSize: 15,flex: 1,),
              EvirTextFDigits(flex: 2,onChanged: (barkod) => barkodAl(barkod),),
            ],
          ),
          Row(
            children: [
              EvirTextB(text: "Adet:",fontSize: 15,flex: 1,),
              EvirTextFDigits(flex: 2,onChanged: (adet) => adetAl(adet),),
            ],
          ),
          EvirTextB(text: "Fiş işlem:",),
          RowEvir2Button(text1: "Ekle",text2: "Çıkar",onPressed1: () => ekle(),onPressed2: () => cikar(),),

          Center(child: Text("Ürün listesi",style: TextStyle(fontWeight: FontWeight.bold,),),),
          SizedBox(width: MediaQuery.of(context).size.width*0.83,height: MediaQuery.of(context).size.height*0.28,
            child: UrunGoster(urunler: urunler,context: context),),
          Text("Toplam fiyat: $toplamFiyat TL"),

          RowEvir2Button(text1: "Satış",text2: "İptal",onPressed1: ()=>son(),onPressed2: ()=>iptal()),
        ],
      ),
    );
    return super.build(context);
  }

  barkodAl(String barkod) {
    urunBarkod = barkod != null && barkod != "" ? barkod : "";
  }

  adetAl(String adet) {
    urunAdet = adet != null && adet != "" ? int.parse(adet) : 0;
  }

  ekle() async {
    Temel.yuklen("bekleniyiniz...", context);
    await temelEkleCikar();
    Navigator.pop(context,true);
    if (urun != null) {
      if (urun.adet >= urunAdet) {
        setState(() {
          if (urunler.isEmpty) {
            urunler.add(Urunler(urun: urun, adet: urunAdet));
            this.toplamFiyat = (urun.fiyat * urunAdet.toDouble());
          } else {
            int index = bul(urun.barkod);
            if (index > -1) {
              if (urunler[index].adet + urunAdet <= urun.adet) {
                urunler[index].adet += urunAdet;
                this.toplamFiyat += (urun.fiyat * urunAdet.toDouble());
              } else {
                Temel.hata(
                    "Satılacak urun depodakinden fazla olamaz! \n Depodaki adet: ${ urunler[index].urun.adet.toString()}",
                    context);
              }
            } else {
              urunler.add(Urunler(urun: urun, adet: urunAdet));
              this.toplamFiyat += (urun.fiyat * urunAdet.toDouble());
            }
          }
        });
      } else {
        Temel.hata(
            "Satılacak urun depodakinden fazla olamaz! \n Depodaki adet: ${urunAdet.toString()}",
            context);
      }
    }else{
      Temel.hata("Aradığınız urun bulunamadı. Lütfen kontrol edin.", context);
    }
    urun=null;
  }

  temelEkleCikar() async {
    print(urunBarkod+"\n");
    if (urunBarkod != "" && urunAdet != 0) {
      print("girdi\n");
      await urunService.getir(urunBarkod).then((value) => urun = value);
      print("çıkıyor ${urun.barkod}\n");
    }
    else {
      Temel.hata(
          "Barkod ve adet olmadan urun uzerinde islem yapamazsınız.", context);
    }
  }

  int bul(String barkod) {
    for (int i = 0; i < urunler.length; i++) {
      if (urunler[i].urun.barkod.compareTo(barkod.trim()) == 0) {
        return i;
      }
    }
    return -1;
  }

  cikar() async {
    if (urunler.isNotEmpty) {
      Temel.yuklen("bekleniyiniz...", context);
      await temelEkleCikar();
      Navigator.pop(context,true);
      if(urun!=null){
        int index = bul(urun.barkod);
        if(index!=-1){
          if(urunAdet < urunler[index].adet){
            setState(() {
              urunler[index].adet-=urunAdet;
              this.toplamFiyat-=(urun.fiyat*urunAdet.toDouble());
            });
          }else if(urunAdet == urunler[index].adet){
            setState(() {
              urunler.removeAt(index);
              this.toplamFiyat-=(urun.fiyat*urunAdet.toDouble());
            });
          }
          else{
            Temel.hata("Listedeki sayıdan fazla urun çıkaramazsınız",context);
          }
        }else{
          Temel.hata("Olmayan ürün çıkarılmaz!.", context);
        }
      }else{
        Temel.hata("Aradığınız urun bulunamadı. Lütfen kontrol edin.", context);
      }
    } else {
      Temel.hata("Olmayan listeden ürün çıkarılmaz!.", context);
    }
    urun=null;
  }

  gonder() async {
    int _sonuc =0;
    if(urunler.isNotEmpty){
      await fisnoOlustur();

      if(fis!=null){
        bool kntrl;
        for(int index=0; index <urunler.length;index ++ ){
          await urunkontrol(urunler[index]).then((value) => kntrl=value);
          if(kntrl){
             satis = new Satis(fis: fis.id,urun: urunler[index].urun.id,adet: urunler[index].adet);
             Urun valu;
             await urunService.getir(urunler[index].urun.barkod).then((value) => valu=value );
             await urunService.guncelle(valu.barkod,adet:valu.adet-urunler[index].adet ).then((value) => _sonuc=value);
             Navigator.pop(context,true);
             await satisServis.ekle(satis).then((value) => _sonuc>0?Temel.iyison(value, context):sonuc(_sonuc));
            Satis sa;
            await satisServis.getir(fis.fisno, urunler[index].urun.barkod).then((value) => sa=value);
            await satisServis.guncelleID(sa);
          }else{
            Navigator.pop(context,true);
            Temel.hata("bu urun depodaki sayı azlığı sebebi ile atlandı : ${urunler[index].urun.barkod}", context);
            toplamFiyat-=(urunler[index].urun.fiyat*urunler[index].adet);
          }
        }
        fis.toplamFiyat=toplamFiyat;
        await fisService.guncelleToplamFiyat(fis);
        temizle();
      }else{
        Navigator.pop(context,true);
        Temel.yukleniyor("Lütfen internet bağlantınız kontrol ediniz", context);
      }

    }else{
      Navigator.pop(context,true);
      Temel.yukleniyor("Benimle dalga mı geçiyorsun ?", context);
    }
  }

  Future<void> fisnoOlustur() async {
    fisNo= DateTime.now().toString()+this.veri.Tc;
    fis=Fis(personelid: veri.id,fisno:fisNo ,tarih:DateTime.now().toString().substring(0,10));
   await fisService.ekle(fis);
   await fisService.getir(fisNo).then((value) => fis=value);
  }

  Future<bool> urunkontrol(Urunler urunler) async {
    bool sonuc= false;
    await urunService.getir(urunler.urun.barkod).then((value) =>sonuc=value.adet>=urunler.adet?true:false);
    return sonuc;
  }

  sonuc(int value) {
    switch(value){
      case 1:
        Temel.iyison("İşlem başarılı", context);
        break;
      default:
        Temel.hata("Bilin meyen bir hata oluştu. Lütfen internetinizi kontrol edin", context);
        break;
    }
  }

  void temizle() {
    setState(() {
      urunler.clear();
      urun=null;
    });
  }

  son() async {
   Temel.yuklen("bekleniyiniz...", context);
    await gonder();
  }

  iptal() {
    temizle();
    Temel.iyison("Veriler başarıyla temizlendi", context);
  }
}
