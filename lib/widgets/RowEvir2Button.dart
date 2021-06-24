
import 'package:flutter/material.dart';
import 'package:market_satis/widgets/EvirExpPad.dart';

/*class RowEvir2Button extends StatefulWidget {
  String text1,text2;
  void Function() onPressed1;
  void Function() onPressed2;
  RowEvir2Button({Key key,this.text1="Tamam",this.text2="İptal",this.onPressed1,this.onPressed2}) : super(key: key);


  @override
  _RowEvir2ButtonState createState() => _RowEvir2ButtonState(text1,text2,
  onPressed1: onPressed1,onPressed2: onPressed2);
}*/

class RowEvir2Button extends StatelessWidget {
  String text1,text2;
  void Function() onPressed1,onPressed2;
  void Function() onLongPress1,onLongPress2;
  void Function(TapDownDetails) onTapDown1,onTapDown2;
  RowEvir2Button({Key key,this.text1="Tamam",this.text2="İptal",this.onTapDown1,this.onTapDown2,this.onPressed1,this.onPressed2,this.onLongPress1,this.onLongPress2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        EvirExpPad(flex: 1,child: GestureDetector(
          child: ElevatedButton(onPressed: onPressed1,onLongPress:onLongPress1 ,child: Text(text1)),
          onTapDown: onTapDown1,
        )),
        EvirExpPad(flex:1,child: GestureDetector(
            child: ElevatedButton(onPressed: onPressed2,onLongPress:onLongPress2, child: Text(text2)),
            onTapDown: onTapDown2,
        )),
      ],
    );
  }
}
