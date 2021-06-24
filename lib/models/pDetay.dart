class pDetay{
  int id;
  int personelID;
  String telefon;
  String email;
  String adress;
  String ekbilgi;

  pDetay({this.id,this.personelID,this.telefon,this.email,this.adress,this.ekbilgi});

  pDetay.jsondan(Map json){
    id=int.tryParse(json["id"].toString());
    personelID=int.tryParse(json["personelid"].toString());
    telefon=json["telefon"];
    email=json["email"];
    adress=json["adress"];
    ekbilgi=json["ekbilgi"];
  }

  Map cevirJson(){
    return{
      "id":id,
      "personelid":personelID,
      "telefon":telefon,
      "email":email,
      "adress":adress,
      "ekbilgi":ekbilgi
    };
  }
}