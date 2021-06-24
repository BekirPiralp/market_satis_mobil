import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_satis/models/urun.dart';
import 'package:market_satis/models/urunListeModel.dart';
import 'package:market_satis/widgets/UrunFormat.dart';

/*class UrunGoster extends StatefulWidget {
  String urun= "deneme";
  int adet=1;
  double fiyat=0.00;
  BuildContext context;
  UrunGoster({Key key,this.urun,this.adet,this.fiyat,this.context}) : super(key: key);

  @override
  _UrunGosterState createState() => _UrunGosterState();
}
*/
class UrunGoster extends StatelessWidget {

  /*veri tabanın daki ürün alındıktan sonra ona göre
  * liste alınacak ve ona göre ayarlanacaktır*/
 /* String urun= "deneme";
  int adet=1;
  int sayi=10;
  double fiyat=0.00;*/

  BuildContext context;
  List<Urunler> urunler;
  UrunGoster({Key key,this.urunler,this.context}) : super(key: key);
      //({this.urun = "deneme urunu deneme",this.adet=1,this.fiyat=0.00});

  @override
  Widget build(BuildContext context) {

    if(urunler!=null&&urunler.length>0){
      return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: urunler.length,
          itemBuilder: (context, sayi) {
            //if (sayi.isOdd) {

            // return Divider();
            //}
            return UrunFormat(urun:(sayi+1).toString()+"."+urunler[sayi].toString(), adet:urunler[sayi].adet, fiyat:urunler[sayi].urun.fiyat).build(context);
          });
    }
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 10,
        itemBuilder: (context, sayi) {
          //if (sayi.isOdd) {

          // return Divider();
          //}
          return UrunFormat(urun:(sayi+1).toString()+"."+"Daha Urun eklenmedi", adet:0, fiyat:0).build(context);
        });
  }
}
