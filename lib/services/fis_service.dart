import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_satis/models/fis.dart';


import 'CouldFirestore.dart';

class FisService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _fis="fisler";

  Future ekle(Fis fis)async{
    /*ekledik*/
    await firestore.collection(_fis).add(fis.cevir());
    /*referans id sini aldık*/
    await Servis.bul(tablo: _fis,kolon:"fisno",deger: fis.fisno ).then((value) => fis.id=value);
    /*id yi güncelledik*/
    await firestore.collection(_fis).doc(fis.id).update(fis.cevir());
    if(fis.id!=""){
      return "İşlem başarılı";
    }
    return "İşlem başarısız";
  }
  Future<Fis>getir(String fisno)async{
    Fis fis;
    String id;
    await Servis.bul(tablo: _fis,kolon:"fisno",deger: fisno ).then((value) => id=value);
    await firestore.collection(_fis).doc(id).get().then((value) => fis =Fis.snapshotdan(value).id!=""?Fis.snapshotdan(value):null );
    return fis;
  }
  Future guncelleToplamFiyat(Fis fis)async{
    await firestore.collection(_fis).doc(fis.id).update(fis.cevir());
  }
}