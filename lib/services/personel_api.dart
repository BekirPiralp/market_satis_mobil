import 'package:http/http.dart' as http;
import 'package:market_satis/services/api.dart';

class PersonelApi{
  static Future getPersonel() {
    return http.get(Uri.parse(Api.urlPersonel));
  }

  static Future getPersonelTc(String tc){
    return http.get(Uri.parse("${Api.urlPersonelSorTc}${tc.trim()}"));
  }
}