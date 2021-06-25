// gerekli olan kütüphaneler
import 'package:flutter/material.dart';
import 'package:market_satis/widgets/Uni.dart';
import 'package:market_satis/widgets/MenuGoster.dart';
import '../Veri.dart';
import '../functions/Temel.dart';

class TemelWidget extends StatefulWidget {
  @override
  temelWidget createState() => temelWidget();
}

class temelWidget extends State {
  //class temelWidget<T extends StatefulWidget> extends State<T> {
  String baslik = "";
  Widget govde = Text("al abim");
  Veri veri;
  String tc;



  void veriSet(BuildContext context) {
    //sınıf içerisinde veriyi kullanırken bu fonksiypnu kullanması gerek
    veri = ModalRoute.of(context).settings.arguments;
  }

  Widget build(BuildContext context) {
    veriSet(context); //veriyi sınıf içerisinde kullanmasa bile set edecek

    return _build(context, this.baslik);
  }



  Widget _build(BuildContext context, String baslik) {

    this.set(baslik: baslik, govde: this.govde);
    return MaterialApp(
      home: Scaffold(
            appBar: AppBar(
              leading: Uni(),
              title: Text(this.baslik),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(Icons.waves),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuGoster(),
                            settings: RouteSettings(
                              arguments: this.veri,
                            ),
                          ));
                    }),
              ],
            ),
            body: Temel().sinirDuzenle(govde),
          ),

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  void set({String baslik, Widget govde}) {
    this.baslik = baslik;
    this.govde = govde;
    setState(() {});
  }
}
