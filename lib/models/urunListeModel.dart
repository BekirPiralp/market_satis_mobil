import 'package:market_satis/models/urun.dart';

class Urunler{
  Urun urun;
  int adet;
  Urunler({this.urun,this.adet});
  @override
  String toString() {

    return " "+urun.marka+" "+urun.ad;
  }
}