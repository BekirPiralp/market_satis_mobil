import 'package:cloud_firestore/cloud_firestore.dart';

class Servis{
  static Future<String> bul({String tablo,String kolon,String deger}) async {

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    QuerySnapshot<Map<String,dynamic>> snapshot;
    /*geri dönüş tablo adı: id map*/
    await firestore.collection(tablo).where(kolon,isEqualTo: deger).snapshots().first.then((value) {
      snapshot=value;
    }) ;

    if(snapshot.docs.isEmpty){
      return "";
    }
    //print(snapshot.docs.first.reference); //ör urunle/21asda323213 gibi tabload:id map yapısı dönüyor
    //print(snapshot.docs.first.id);
    return snapshot.docs.first.id;
  }
}