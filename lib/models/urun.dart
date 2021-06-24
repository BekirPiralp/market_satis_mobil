import 'package:cloud_firestore/cloud_firestore.dart';

class Urun {
  String id;
  String ad;
  int adet;
  String barkod;
  double fiyat;
  String marka;
  String uretimYeri;
  DocumentReference reference;

  Urun(
      {this.id = "",
      this.ad = "",
      this.adet = -1,
      this.barkod = "",
      this.fiyat = -1,
      this.marka = "",
      this.uretimYeri = ""});

  Urun.mapden(Map<String, dynamic> map, {this.reference})
      : assert(map["ad"] != null),
        this.ad = map["ad"],
        this.adet = map["adet"],
        this.barkod = map["barkod"],
        this.fiyat = map["fiyat"],
        this.marka = map["marka"],
        this.uretimYeri = map["uretimYeri"],
        this.id = map["id"];

  Urun.snapshotdan(DocumentSnapshot snapshot)
      : this.mapden(snapshot.data(), reference: snapshot.reference);

  Map<String, dynamic> cevir() {
    return {
      "id": this.id,
      "ad": this.ad,
      "adet": this.adet,
      "barkod": this.barkod,
      "fiyat": this.fiyat,
      "marka": this.marka,
      "uretimYeri": this.uretimYeri
    };
  }
}
