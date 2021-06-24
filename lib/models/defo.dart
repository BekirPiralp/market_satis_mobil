class Defo{
  int id;
  int personelID;
  String barkod;
  int adet;
  String aciklama;

  Defo({this.id=0,this.personelID=0,this.barkod="",this.adet=0,this.aciklama=""});

  Defo.jsonda(Map json){
    id=int.tryParse(json["id"].toString());
    personelID=int.tryParse(json["personelid"].toString());
    barkod=json["barkod"].toString().trim();
    adet=int.tryParse(json["adet"].toString());
    aciklama=json["aciklama"];
  }

  Map <String,dynamic> cevirJson(){
    return{
      "id":id,
      "personelid":personelID,
      "barkod":barkod,
      "adet":adet,
      "aciklama":aciklama
    };
  }
  Object cevir(){
    return {
      "id":null,
      "personelid":personelID,
      "barkod":barkod,
      "adet":adet,
      "aciklama":aciklama
    };
  }
}