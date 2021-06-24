import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class hakkinda extends StatefulWidget {
  @override
  _hakkindaState createState() => _hakkindaState();
}

class _hakkindaState extends State<hakkinda> {
  //açık oluşmaması için temelWidget'tan extends edilmemiştir.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("<<<== ! HAKKINDA ! ==>>>"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage("assets/selmin.png"),
                width: 200, // genişlik
                height: 200, // yükseklik
              ),
              Text(
                "Hakkında",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Bu uygulama Selçuk Üniversitesi Bilgisayar Mühendisliği Bölümü " +
                        "Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen " +
                        "3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında " +
                        "183301120 numaralı Bekir PİRALP tarafından 25.04.2021 günü yapılmıştır."
                            .toString(),
                    // to sitring katınca ekrana göre gayet güzelce ayarladı
                    textAlign: TextAlign.center,
                    //softWrap: true,
                    //false olursa sonsuz satır gibi davranır true olursa parent oğenin sınıralarına ve overflow tipine tabi olur.
                    //overflow: TextOverflow.clip, // taşma durumunda nasıl kırpılsın . Örnekte parent widget sınırına yani satır sonuna gelince kırpılsın ve alta atılsın
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
