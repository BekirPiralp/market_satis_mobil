
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';

/*class EvirTextFDigits extends StatefulWidget {
  String labelText;
  int flex;
  EvirTextFDigits({Key key,this.labelText="",this.flex}) : super(key: key);

  @override
  _EvirTextFDigitsState createState() => _EvirTextFDigitsState(labelText,flex);
}*/

class EvirTextFDigits extends StatelessWidget {
  String labelText;
  String hintText;
  int flex;
  void Function(String) onChanged;
  EvirTextFDigits({Key key,this.labelText="",this.hintText="",this.flex,this.onChanged}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return EvirExpPad(
      flex: flex,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        maxLines: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (a)=>onChanged(a),
      ),
    );
  }
}
