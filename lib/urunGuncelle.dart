import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_satis/Veri.dart';

class urunGuncelle extends StatefulWidget {
  @override
  _urunGuncelleState createState() => _urunGuncelleState();
}

class _urunGuncelleState extends State<urunGuncelle> {
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
        title: Text("Ürün Güncelle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
