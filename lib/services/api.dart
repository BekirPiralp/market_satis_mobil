class Api{
  /*local veri çekme için local json-server kullanımıştır.
  * Emulatör varsayılan Gateway 10.0.2.2*/
  static const String url = "http://10.0.2.2:3000/";
  static const String urlPersonel ="${url}personeller";
  static const String urlSifre ="${url}sifreler";
  static const String urlPersonelDetay ="${url}personelDetay";
  static const String urlIade ="${url}iade";
  static const String urlDefo ="${url}defo";


  static const String urlPersonelSorTc ="${urlPersonel}?tc=";
  static const String urlSifreSor ="${urlSifre}?personelid=";
  static const String urlSifreGuncelle ="${urlSifre}/";
  static const String urlPersonelDetaySor ="${urlPersonelDetay}?personelid=";
  static const String urlDefoGuncelle ="${urlDefo}/";

  static const Map<String,String> baslik={"Content-Type": "application/JSON"};

}