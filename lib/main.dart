import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_satis/navigation/Routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main/myHomePage.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /*garip birşekilde sistemden bir programın 49346 nolu porta bağalntıyı reddettiğini
  * söyledi bu yüzden bende defendr da özel izin oluşturdum eğere ki hata verirse bundan olabilir*/
  runApp(MyApp());
}

 ilkayar() async {

}

class MyApp extends StatelessWidget {

  Routes routes;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    routes = new Routes(context) ;
    return MaterialApp(
      title: 'Market Satış',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: routes.initialGet(),
      routes: routes.get(),
      home: MyHomePage(title: 'Giriş',routes: routes,context:context),
    );
  }
}


