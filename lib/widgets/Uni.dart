
import 'package:flutter/material.dart';
import 'package:market_satis/functions/Temel.dart';

import '../main.dart';

/*class Uni extends StatefulWidget {
  const Uni({Key key}) : super(key: key);

  @override
  _UniState createState() => _UniState();
}
*/
class Uni extends StatelessWidget {
  const Uni({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
    CircleAvatar(
      backgroundColor: Colors.blue,
      backgroundImage: NetworkImage("https://yt3.ggpht.com/ytc/AAUvwnhJHNV-p_Ar0yQBlle7GsM_n1D8NByL71TUmWf3=s900-c-k-c0x00ffffff-no-rj"),
          //https://araba.ogren-sen.com/pars_docs/refs/1/145/145_html_m4205ff3.png"),//https://cdn.pixabay.com/photo/2014/10/22/17/51/exit-498428_960_720.jpg"),
    );
  }
}
