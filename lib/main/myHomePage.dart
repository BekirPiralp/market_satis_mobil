import 'package:flutter/material.dart';
import 'package:market_satis/main/Govde.dart';
import 'package:market_satis/navigation/Routes.dart';

class MyHomePage extends StatefulWidget {
  BuildContext context;
  MyHomePage({Key key, this.title ,this.routes, this.context}) : super(key: key);
  Routes routes;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(routes,context);
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  BuildContext context;
  Routes routes;

  Animation animasyon;
  AnimationController animasyonKontrol;

  _MyHomePageState(Routes routes,this.context){
    this.routes=routes;
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


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    //geridönüş
    return AnimatedBuilder(
        animation: animasyonKontrol,
        builder: (BuildContext context, Widget child){
             return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                ),
              ),
              body: Transform(
              transform: Matrix4.translationValues(animasyon.value*width, 0, 0),
                child:Govde(),),
            );},
    );
  }
}