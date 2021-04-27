import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_satis/Veri.dart';

class urunEkle extends StatefulWidget {
  @override
  _urunEkleState createState() => _urunEkleState();
}

class _urunEkleState extends State<urunEkle> {
  //Değişkenler
  Veri veri;
  String Tc;

  //Tanımlar
  @override
  Widget build(BuildContext context) {
    veri = ModalRoute.of(context).settings.arguments;
    Tc = veri.Tc;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ürün Ekle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Barkod
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Barkod:",
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

          //Marka
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Marka:",
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
          ),

          //Üretim yeri
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Üretim Yeri:",
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
          ),

          //Açıklama
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Açıklama:",
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
          ),

          //Fiyat
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Fiyat:",
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
              keyboardType: TextInputType.numberWithOptions(
                signed: false,
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
              ],
            ),
          ),

          //Adet
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Adet:",
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

          //Resim

          //Butonlar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () {}, child: Text("Kaydet")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () {}, child: Text("İptal")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
