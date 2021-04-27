import 'package:flutter/material.dart';
import 'package:market_satis/Veri.dart';

class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  //Değişkenler
  Veri veri;
  String Tc;
  String Ad = "Deneme Ad";
  String Soyad = "Deneme Soyad";
  String Cinsiyet;
  String Yetki;
  String Telefon = "05555555555";
  String Email = "01Deneme@deneme.com";
  String Aciklama =
      "Deneme olarak Adress oluşturulmutur. Bu Adress test amaçlıdır ve gerekli veri tabanı bağlantılarından sonra düzeltilecektir";
  String EkBilgi =
      "Deneme olarak ek bilgi oluşturulmutur. Bu ek bilgi test amaçlıdır ve gerekli veri tabanı bağlantılarından sonra düzeltilecektir";

  //tanımlar
  @override
  Widget build(BuildContext context) {
    veri = ModalRoute.of(context).settings.arguments;
    Tc = veri.Tc;
    Cinsiyet = true ? "Erkek" : "Kadın";
    Yetki = false ? "Yönetici" : "Çalışan";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profil"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //Temelbilgi
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Ad:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Soyad:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Cinsiyet:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Telefon:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Email:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Yetki:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$Ad"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$Soyad"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$Cinsiyet"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$Telefon"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$Email"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$Yetki"),
                  ),
                ],
              ),
            ],
          ),
          //Adress
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Adress:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 340,

                padding: EdgeInsets.all(8.0),
                //color:Colors.white54,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border.all(
                    color: Colors.amber,
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text("$Aciklama".toString()),
              ),
            ],
          ),
          //Ekbilgi
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Ek bilgi:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 340,

                padding: EdgeInsets.all(8.0),
                //color:Colors.white54,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border.all(
                    color: Colors.amber,
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text("$EkBilgi".toString()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
