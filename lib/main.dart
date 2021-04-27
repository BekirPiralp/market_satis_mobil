import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:market_satis/defo.dart';
import 'package:market_satis/giris.dart';
import 'package:market_satis/iade.dart';
import 'package:market_satis/main.dart';
import 'package:market_satis/hakkinda.dart';
import 'package:market_satis/Veri.dart';
import 'package:market_satis/profil.dart';
import 'package:market_satis/sifreDegistir.dart';
import 'package:market_satis/urunEkle.dart';
import 'package:market_satis/urunGuncelle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market Satış',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/main': (context) => MyHomePage(),
        '/hakkinda': (contex) => hakkinda(),
        '/giris': (context) => giris(),
        '/sifreDegistir': (context) => sifreDegistir(),
        '/profil': (context) => profil(),
        '/urunEkle': (context) => urunEkle(),
        '/urunGuncelle': (context) => urunGuncelle(),
        '/defo': (context) => defo(),
        '/iade': (context) => iade(),
      },
      home: MyHomePage(title: 'Giriş'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //değişkenler
  String Tc = "", Sifre = "";

  //Tanımlamalar
  void _TcAl(String Text) {
    setState(() {
      Tc = Text;
    });
  }

  void _SifreAl(String Text) {
    setState(() {
      Sifre = Text;
    });
  }

  void _kontrol() {
    Veri veri = new Veri();
    veri.Tc = this.Tc;
    // Şifre kontrol mekanizması
    if (this.Tc.length == 11) {
      //Navigator.pushNamed(context, '/giris',arguments: veri);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => giris(),
          settings: RouteSettings(
            arguments: veri,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //Degişkenler
    bool buttonaktif;
    //tanımlar
    if (Tc.length == 11) {
      buttonaktif = true;
    } else {
      buttonaktif = false;
    }
    //geridönüş
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Giriş yapabilmek için TC'nizi ve şifrenizi giriniz.",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "TC kimlik no:",
                  hintText: "Lütfen istenilen bilgiyi giriniz",
                ),
                maxLines: 1,
                maxLength: 11,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (Text) {
                  _TcAl(Text);
                },
              ),
            ),

            SizedBox(
              width: 340,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Şifreniz:",
                  hintText: "Lütfen istenilen bilgiyi giriniz",
                  hintTextDirection: TextDirection.rtl,
                ),
                maxLines: 1,
                onChanged: (Text) {
                  _SifreAl(Text);
                },
              ),
            ),

            ElevatedButton(
              onPressed: buttonaktif ? _kontrol : null,
              child: Text("Giriş"),
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hakkinda()),
                  );
                },
                child: Text("Hakkında")),
            //style: Theme.of(context).textTheme.headline4,
          ],
        ),
      ),
    );
  }
}
