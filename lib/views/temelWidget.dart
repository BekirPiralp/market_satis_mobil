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

class temelWidget extends State with SingleTickerProviderStateMixin{
  //class temelWidget<T extends StatefulWidget> extends State<T> {
  String baslik = "";
  Widget govde = Text("al abim");
  Veri veri;
  String tc;

  Animation animasyon;
  AnimationController animasyonKontrol;

  void veriSet(BuildContext context) {
    //sınıf içerisinde veriyi kullanırken bu fonksiypnu kullanması gerek
    veri = ModalRoute.of(context).settings.arguments;
  }

  Widget build(BuildContext context) {
    veriSet(context); //veriyi sınıf içerisinde kullanmasa bile set edecek

    return _build(context, this.baslik);
  }

  @override
  void initState(){
    super.initState();
    animasyonKontrol =
        AnimationController(duration:Duration(seconds: 2), vsync: this);
    animasyon= Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(
        parent: animasyonKontrol,
        curve: Curves.fastOutSlowIn));
    animasyonKontrol.forward();
  }

  Widget _build(BuildContext context, String baslik) {
    final double width = MediaQuery.of(context).size.width;
    this.set(baslik: baslik, govde: this.govde);
    return MaterialApp(
      home: AnimatedBuilder(
        animation: animasyonKontrol,
        builder: (BuildContext context, Widget child){
          return Scaffold(
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
            body: Transform(
              transform: Matrix4.translationValues(animasyon.value*width, 0, 0),
              child: Temel().sinirDuzenle(govde),
            ),
          );
        },
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
