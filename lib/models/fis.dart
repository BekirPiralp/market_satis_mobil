import 'package:cloud_firestore/cloud_firestore.dart';

class Fis {
  String id;
  String fisno;
  int personelid;
  String tarih;
  double toplamFiyat;
  DocumentReference reference;

  Fis({this.id="",this.personelid=0,this.fisno="",this.tarih="",this.toplamFiyat=0});

  Fis.mapden(Map<String,dynamic> map,{this.reference}){
    this.id=reference.id;
    this.fisno=map["fisno"];
    this.personelid=map["personelid"];
    this.tarih=map["tarih"];
    this.toplamFiyat=double.tryParse(map["toplamFiyat"].toString());
  }

  Fis.snapshotdan(DocumentSnapshot snapshot)
      :this.mapden(snapshot.data(),reference: snapshot.reference);

  Map<String,dynamic> cevir(){
    return{
      "id":this.id,
      "fisno":this.fisno,
      "personelid":this.personelid,
      "tarih":this.tarih,
      "toplamFiyat":this.toplamFiyat
    };
  }
}