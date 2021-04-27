import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_satis/Veri.dart';
import 'package:market_satis/defo.dart';
import 'package:market_satis/hakkinda.dart';
import 'package:market_satis/iade.dart';
import 'package:market_satis/profil.dart';
import 'package:market_satis/sifreDegistir.dart';
import 'package:market_satis/urunEkle.dart';
import 'package:market_satis/urunGuncelle.dart';

class giris extends StatefulWidget {
  @override
  _girisState createState() => _girisState();
}

class _girisState extends State<giris> {
  //Değişkenler
  Veri veri;
  String Tc;
  String Ad = "Deneme";
  String Soyad = "DenemeSoyad";
  String AdSoyad;
  double toplamFiyat = 27.2; // varsayılan
  int sayi = 15;
  DateTime suankiTarih;
  List<Widget> Menu = [];
  bool kontrol = false;

  //Fonksiyonlar
  DateTime zaman() {
    setState(() {
      suankiTarih = DateTime.now();
    });
    return suankiTarih;
  }

  Widget _buildUrun() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, sayi) {
          if (sayi.isOdd) return Divider();
          /*2*/

          return _buildRow("deneme urunu deneme", 10, 17.12);
        });
  }

  Widget _buildRow(String urun, int adet, double fiyat) {
    String Bilgi =
        "Adet: " + adet.toString() + " BirimFiyat: " + fiyat.toString() + " TL";
    return ListTile(
      title: Text(urun),
      subtitle: Text(Bilgi.toString()),
      onTap: () {
        setState(() {});
      },
    );
  }

  void menuEkle(String title, fn(context)) {
    Menu.add(
      ListTile(
        title: Text(title),
        trailing: Icon(
          Icons.aspect_ratio,
          color: Colors.blueAccent,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => fn(context),
                settings: RouteSettings(
                  arguments: veri,
                ),
              ));
        },
      ),
    );
  }

  void _actions() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = Menu.map((Widget e) {
            return e;
          });

          final divided = ListTile.divideTiles(
            context: context,
            tiles: Menu,
            color: Colors.amber,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text("M E N Ü"),
              centerTitle: true,
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  //aşırı yüklemeler ve yazmalar
  @override
  Widget build(BuildContext context) {
    veri = ModalRoute.of(context).settings.arguments;
    Tc = veri.Tc;
    AdSoyad = this.Ad + " " + this.Soyad;
    String baslik;
    baslik = "Hoşgeldiniz";
    Timer(Duration(seconds: 1), () {
      setState(() {
        zaman();
      });
    });

    // _sayac.start();
    _girisState();

    //Açılı menu ye eleman ekleme
    Menu.clear();
    menuEkle("Satış", (context) => giris());
    menuEkle("İade", (context) => iade());
    menuEkle("Ürün Ekle", (context) => urunEkle());
    menuEkle("Ürün Güncelle", (context) => urunGuncelle());
    menuEkle("Defo", (context) => defo());
    menuEkle("Profil", (context) => profil());
    menuEkle("Şifre Değiştir", (context) => sifreDegistir());
    menuEkle("Hakkında", (context) => hakkinda());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(baslik.toString()),
        actions: [
          IconButton(
            icon: Icon(Icons.waves),
            onPressed: _actions,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Tarih saat:",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Ad Soyad:",
                      style: TextStyle(
                        fontSize: 15,
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
                    child: Text(
                      zaman().toString().substring(0, 19),
                      style: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AdSoyad,
                      style: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Barkod:",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 290,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17),
                    child: Text(
                      "Adet:",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 290,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Fiş işlem:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Ekle"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Çıkar"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              "Ürün listesi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 340,
            height: 188,
            child: _buildUrun(),
          ),
          Text("Toplam fiyat: $toplamFiyat TL"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Satış")),
                ElevatedButton(onPressed: () {}, child: Text("İptal")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
