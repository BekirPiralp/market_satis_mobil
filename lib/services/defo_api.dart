import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:market_satis/models/defo.dart';
import 'package:market_satis/models/urun.dart';
import 'package:market_satis/services/api.dart';
import 'package:market_satis/services/urun_service.dart';

class DefoApi{
  static UrunService _urunService= UrunService();

  static Future get(){
    return http.get(Uri.parse(Api.urlDefo+"?id=1"));
  }
  static Future<int> add(Defo defo)async{
    Urun urun ;
    int sonuc=0 ;

    await _urunService.getir(defo.barkod).then((value) =>urun=value );
    if(urun == null||urun.adet<defo.adet)
      return -1;
    urun.adet-=defo.adet;
    await _urunService.guncelle(urun.barkod,adet: urun.adet);

    /*{"Content-Type": "application/JSON"} map i olmadan sadece 2xx li sonuç dödürüp jsonda işlem yapmıyor*/
    await http.post(Uri.parse(Api.urlDefoGuncelle),body: json.encode(defo.cevir()),headers: Api.baslik).then((value){
      sonuc =value.statusCode==201?1:-1;
    });
    return sonuc;
  }
  static Future<void> deneme() async {

   await get().then((value) {
     int as = value.statusCode;
      List a =json.decode(value.body);
       a.map((e) => Defo.jsonda(e));
       Defo defo = (a.map((e) => Defo.jsonda(e)).toList())[0];
      print(json.decode(value.body));
    });
  }
}