import 'package:market_satis/views/iade.dart';

class Iade{
  int id;
  int personelID;
  String fis;
  String barkod;
  int adet;
  String aciklama;

  Iade({this.id=0,this.personelID=0,this.fis="",this.barkod="",this.adet=0,this.aciklama=""});
  Iade.idyok({this.personelID=0,this.fis="",this.barkod="",this.adet=0,this.aciklama=""});

  Iade.jsonda(Map json){
    id=int.tryParse(json["id"].toString());
    personelID=int.tryParse(json["personelid"].toString());
    fis=json["fis"].toString().trim();
    barkod=json["barkod"].toString().trim();
    adet=int.tryParse(json["adet"].toString());
    aciklama=json["aciklama"];
  }

  Map<String,dynamic> cevirJson(){
    return{
      "id":id,
      "personelid":personelID,
      "fis":fis,
      "barkod":barkod,
      "adet":adet,
      "aciklama":aciklama
    };
  }
  Map<String,dynamic> cevir(){
    return{
      "id":null,
      "personelid":personelID,
      "fis":fis,
      "barkod":barkod,
      "adet":adet,
      "aciklama":aciklama
    };
  }
}