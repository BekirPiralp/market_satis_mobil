import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:market_satis/models/sifre.dart';

import 'api.dart';

class sifreApi {
  static Future getsifre(int personelid) {
    return http.get(Uri.parse("${Api.urlSifreSor}${personelid.toString()}"));
  }

  static Future patchsifre(int personelid, String sifre) async {
    Map<String, dynamic> map = {"sifre": sifre.trim()};
    int sifreid = 0;
    await getsifre(personelid).then((yanit) {
      if (yanit.statusCode == 200) {
        List sifreyanit = json.decode(yanit.body);
        Sifre sfre = (sifreyanit.map((e) => Sifre.jsondan(e)).toList())[0];
        if (sfre != null) {
          sifreid = sfre.id;
        }
      }
    });
    return http.patch(Uri.parse("${Api.urlSifreGuncelle}${sifreid.toString()}"),
        body: map);
  }
}
