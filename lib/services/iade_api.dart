import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:market_satis/models/iade.dart';
import 'package:market_satis/models/satis.dart';
import 'package:market_satis/services/api.dart';
import 'package:market_satis/services/satis_servis.dart';
import 'package:market_satis/views/iade.dart';

class IadeApi{
  static SatisServis satisServis= new SatisServis();
  static Satis _satis;
  static Future get(){
    return http.get(Uri.parse(Api.urlIade));
  }

  static Future<int> add(Iade iade) async {
    int sonuc=0;
    if(iade == null || iade.barkod==null ||iade.barkod==""||iade.fis==null||iade.fis==""||iade.adet==0||iade.adet==null) {
      sonuc= -1;//değerleri eksisksiz
    }
    await satisServis.getir(iade.fis, iade.barkod).then((value) =>_satis=value);
    if(_satis==null)
      sonuc= -2;//böylebir satış yok veya değerler yanlış
    //sınıktı olursa defo apı deki guncelleye bezer url haline getir
    if(iade.adet>_satis.adet)
      sonuc= -3;//yanlış değerler

    await http.post(Uri.parse(Api.urlIade+"/"),body: json.encode(iade.cevir()),headers:Api.baslik).then((value){
      sonuc=value.statusCode==201?1:-4;
    });
    print("\nsonuc:"+sonuc.toString()+"\n");
    return sonuc;
  }
}