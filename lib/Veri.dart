class Veri {
  int id;
  String Tc;
  String Ad = "Deneme Ad";
  String Soyad = "Deneme Soyad";
  String Cinsiyet;
  String Yetki;
  String Sifre = "";
  String Telefon = "05555555555";
  String Email = "01Deneme@deneme.com";
  String Aciklama =
      "Deneme olarak Adress oluşturulmutur. Bu Adress test amaçlıdır ve gerekli veri tabanı bağlantılarından sonra düzeltilecektir";
  String EkBilgi =
      "Deneme olarak ek bilgi oluşturulmutur. Bu ek bilgi test amaçlıdır ve gerekli veri tabanı bağlantılarından sonra düzeltilecektir";

  Veri(){
    Cinsiyet = true ? "Erkek" : "Kadın";
    Yetki = false ? "Yönetici" : "Çalışan";
  }
}
