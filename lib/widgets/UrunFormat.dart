import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*class UrunFormat extends StatefulWidget{

  String urun= "deneme";
  int adet=1;
  double fiyat=0.00;
  String bilgi;
  UrunFormat({
    Key key ,this.urun,this.adet,this.fiyat}):super(key: key);

  @override
  String cevirString(){
    return "Adet: " + adet.toString() + " BirimFiyat: " + fiyat.toString() + " TL";
  }

  @override
  State<StatefulWidget> createState ()=>_UrunFormat(bilgi,urun);
}*/

class UrunFormat extends StatelessWidget{
  String urun= "deneme";
  int adet=1;
  double fiyat=0.00;
  String bilgi;

  UrunFormat({
    Key key ,this.urun,this.adet,this.fiyat}):super(key: key);


  String cevirString(){
    return "Adet: " + adet.toString() + " BirimFiyat: " + fiyat.toString() + " TL";
  }

  @override
  Widget build(BuildContext context) {
    bilgi =cevirString();
    return ListTile(
      title: Text(urun),
      subtitle: Text(bilgi.toString()),
      onTap: () {
        /*setState(() {
        });*/
      },
    );
  }

}