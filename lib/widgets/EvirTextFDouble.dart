import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';

/*class EvirTextFDouble extends StatefulWidget {
  String labelText;
  EvirTextFDouble({Key key,this.labelText=""}) : super(key: key);

  @override
  _EvirTextFDoubleState createState() => _EvirTextFDoubleState(labelText);
}
*/
class EvirTextFDouble extends StatelessWidget {
  String labelText;
  void Function(String) onChanged;
  EvirTextFDouble({Key key,this.labelText="",this.onChanged}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return EvirExpPad(
      child: TextField(

        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        maxLines: 1,
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: true,

        ),
        inputFormatters: [
          FilteringTextInputFormatter.singleLineFormatter,
        ],
        onChanged: (a)=>onChanged(a),
      ),
    );
  }
}
