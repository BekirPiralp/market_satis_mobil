class Personel{
  int id;
  String ad;
  String soyad;
  String tc;
  bool yetki;
  String cinsiyet;
  Personel({this.id=0,this.tc="11111111111",this.ad="Deneme Ad",this.soyad="Deneme Soyad",this.cinsiyet="Erkek",this.yetki=false});
  //Personel.({this.tc,this.ad,this.soyad,this.yetki});

  Personel.jsondan(Map json){
    id=int.tryParse(json["id"].toString());
    ad=json["ad"];
    soyad=json["soyad"];
    tc=json["tc"].toString().trim();
    yetki=json["yetki"];
    cinsiyet=json["cinsiyet"];
  }

  Map cevirJson(){
    return{
      "id":id,
      "ad":ad,
      "soyad":soyad,
      "tc":tc,
      "yetki":yetki,
      "cinsiyet":cinsiyet
    };
  }
}