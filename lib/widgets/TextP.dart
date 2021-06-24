import 'package:flutter/material.dart';

/*class TextP extends StatefulWidget {
  String text;
  double edge;
  TextP(this.text,{Key key,this.edge=8.0}) : super(key: key);

  @override
  _TextPState createState() => _TextPState(text,edge: edge);
}*/

class TextP extends StatelessWidget {
  String text;
  double edge;
  TextP(this.text,{Key key,this.edge=8.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          text,
    ));
  }
}
