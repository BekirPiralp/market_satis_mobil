import 'package:http/http.dart' as http;

import 'api.dart';

class pDetayApi{
  static Future getPersonelDetay(){
    return http.get(Uri.parse("${Api.urlPersonelDetay}"));
  }
  static Future getPersonelDetayPersonelId(int personelid){
    return http.get(Uri.parse("${Api.urlPersonelDetaySor}${personelid.toString()}"));
  }
}