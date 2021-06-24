import 'package:flutter/material.dart';

/*class TextBold extends StatefulWidget {
  String text;
  TextBold(this.text,{Key key}) : super(key: key);

  @override
  _TextBoldState createState() => _TextBoldState(text);
}
*/
class TextBold extends StatelessWidget {
  String text;
  TextBold(this.text,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          text,
          style: TextStyle(
          fontWeight: FontWeight.bold,
      )),
    );
  }
}
