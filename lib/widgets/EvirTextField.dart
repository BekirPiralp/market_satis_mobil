import 'package:flutter/material.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';

/*class EvirTextField extends StatefulWidget {
  String labelText;
  int maxLines;
  EvirTextField({Key key,this.labelText="",this.maxLines=1}) : super(key: key);

  @override
  _EvirTextFieldState createState() => _EvirTextFieldState(labelText,maxLines);
}
*/
class EvirTextField extends StatelessWidget {
  String labelText;
  int maxLines;
  void Function(String) onChanged;
  EvirTextField({Key key,this.labelText="",this.maxLines=1,this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EvirExpPad(
      child: TextField(
        //controller: TextEditingController(),//türünden bir değişken ile txt kontrol edilebilir
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        maxLines: maxLines,
        onChanged: (a)=>onChanged(a),
      ),
    );
  }
}
