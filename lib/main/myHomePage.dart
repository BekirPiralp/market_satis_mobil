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

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;

  Routes routes;

  _MyHomePageState(Routes routes,this.context){
    this.routes=routes;
  }

  @override
  Widget build(BuildContext context) {

    //geridönüş
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body:Govde(),
    );
  }
}