import 'package:cloud_firestore/cloud_firestore.dart';

class Satis {
  String id;
  String fis;
  String urun;
  int adet;
  DocumentReference reference;
  Satis({this.id="",this.fis="",this.urun="",this.adet=0});

  Satis.mapden(Map<String,dynamic> map,{this.reference}){
    this.id??=reference.id;
    this.fis??=map["fis"];
    this.urun??=map["urun"];
    this.adet??=map["adet"];
  }

  Satis.snapshotdan(DocumentSnapshot snapshot)
      :this.mapden(snapshot.data(),reference:snapshot.reference);

  Map<String,dynamic> cevir (){
    return{
      "id":this.id,
      "fis":this.fis,
      "urun":this.urun,
      "adet":this.adet
    };
  }
}