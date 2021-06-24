class Sifre{
  int id;
  int personelID;
  String sifre;

  Sifre({this.id,this.personelID,this.sifre});

  Sifre.jsondan(Map json){
    id=int.tryParse(json["id"].toString());
    personelID=int.tryParse(json["personelid"].toString());
    sifre=json["sifre"].toString().trim();
  }

  Map cevirJson(){
    return{
      "id":id,
      "personelid":personelID,
      "sifre":sifre
    };
  }
}