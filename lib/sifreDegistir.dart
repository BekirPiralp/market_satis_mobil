import 'package:flutter/material.dart';
import 'package:market_satis/Veri.dart';

class sifreDegistir extends StatefulWidget {
  @override
  _sifreDegistirState createState() => _sifreDegistirState();
}

class _sifreDegistirState extends State<sifreDegistir> {
  //Değişkenler
  Veri veri;

  String Tc;
  String mevcutSifre, YeniSifre;

  //Tanımlar
  @override
  Widget build(BuildContext context) {
    veri = ModalRoute.of(context).settings.arguments;
    Tc = veri.Tc;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Şifre Değiştir"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Mevcut şifre:",
              ),
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              //gerekli kontrol
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Yeni şifre:",
              ),
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              //gerekli kontrol
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Yeni şifre Tekrar"),
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              //gerekli kontrol
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Tamam"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("İptal"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
