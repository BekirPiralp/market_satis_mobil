import 'package:flutter/material.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';

/*class EvirTextFPassword extends StatefulWidget {
  String labelText;
  EvirTextFPassword({Key key,this.labelText}) : super(key: key);

  @override
  _EvirTextFPasswordState createState() => _EvirTextFPasswordState(labelText);
}*/

class EvirTextFPassword extends StatelessWidget {
  String labelText;
  void Function(String) onChanged;
  EvirTextFPassword({Key key,this.labelText,this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return EvirExpPad(
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        onChanged: (a){
          onChanged(a);
        },
      ),
    );
  }
}
