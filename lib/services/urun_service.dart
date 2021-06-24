import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_satis/models/urun.dart';
import 'package:market_satis/services/CouldFirestore.dart';
import 'package:flutter/material.dart';

class UrunService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<int> ekle(Urun urun) async{
    String id;
    Urun kntrl=null;
    await getir(urun.barkod).then((value) => kntrl=value);
    if(kntrl==null){
      await firestore.collection("urunler").add(urun.cevir());
      await Servis.bul(tablo: "urunler", kolon: "barkod", deger: urun.barkod)
          .then((value) => id = value);
      urun.id=id;
      await firestore.collection("urunler").doc(id).update(urun.cevir());
      return 1;
    }
    return -1;
  }

  Future<int> guncelle(String barkod, {int adet=-1, double fiyat=-1})async {
    String id;
    int sonuc = 0;
    if(barkod==""||barkod==null)
      return sonuc;
    Map<String, dynamic> data;
    if (adet >= 0 && fiyat >= 0) {
      data = {"adet": adet, "fiyat": fiyat};
    } else if (fiyat >= 0) {
      data = {"fiyat": fiyat};
    } else if (adet >= 0) {
      data = {"adet": adet};
    } else{
      return sonuc;
    }

    await Servis.bul(tablo: "urunler", kolon: "barkod", deger: barkod)
        .then((value) => id = value);
    if (id != null) {
      if (id != "") {
        await firestore.collection("urunler").doc(id).update(data);
        sonuc = 1;
      } else {
        sonuc=-1;
      }
    }else{
      sonuc=-1;
    }
    return sonuc;
  }

  /*Şuan için kullanıulacak yer yok ama örenk olarak dursun*/
  Future _sil(Urun urun)async{
    await firestore.collection("urunler").doc(urun.id).delete();
  }

  Future<Urun>getir(String barkod)async{
    String id;
    Urun urun;
    await Servis.bul(tablo: "urunler", kolon: "barkod", deger: barkod)
        .then((value) => id = value);
    if(id=="")
      return null;
    await firestore.collection("urunler").doc(id).get().then(
            (value) => urun=Urun.snapshotdan(value)!=null?Urun.snapshotdan(value):null);

    return urun;
  }
}
