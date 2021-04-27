import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_satis/Veri.dart';

class iade extends StatefulWidget {
  @override
  _iadeState createState() => _iadeState();
}

class _iadeState extends State<iade> {
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
        title: Text(" İade "),
      ),
      body: Column(
        children: [
          //Fiş no
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Fiş no:",
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

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

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Açıklama:",
                  border: OutlineInputBorder(),
                ),
                maxLines: 20,
              ),
            ),
          ),

          //Açıklama

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
