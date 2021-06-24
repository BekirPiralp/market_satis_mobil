import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_satis/models/satis.dart';
import 'package:market_satis/services/fis_service.dart';
import 'package:market_satis/services/urun_service.dart';

class SatisServis{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static const String _satis="satislar";
  Future<String> ekle (Satis satis)async{
    await firestore.collection(_satis).add(satis.cevir());
    await firestore.collection(_satis).where("fis", isEqualTo: satis.fis)
        .where("urun",isEqualTo: satis.urun).snapshots().first.then((value) => satis.id=value.docs.first.id);
    await firestore.collection(_satis).doc(satis.id).update(satis.cevir());
    if(satis.id!=""){
      return "İşlem başarılı";
    }
    return "İşlem başarısız";
  }
  Future<Satis> getir(String fisno,String barkod)async{
    Satis satis;
    FisService fisService = FisService();
    UrunService urunService = UrunService();
    String fis="",urun="",id="";
    await fisService.getir(fisno).then((value) => fis=value.id);
    await urunService.getir(barkod).then((value) => urun=value.id);
    if(fis !=""&&urun!=""){
      await firestore.collection(_satis).where("fis",isEqualTo: fis).where("urun",isEqualTo: urun)
          .snapshots().first.then((value) => id=value!=null?value.docs.first.reference.id:"");
      if(id=="")
        return null;

      await firestore.collection(_satis).doc(id).get().then((value) => satis=value!=null?Satis.snapshotdan(value):null);
      satis.id=id;
    }
    return satis;
  }
  Future guncelleID(Satis satis) async {
    await firestore.collection(_satis).doc(satis.id).update(satis.cevir());
  }
}