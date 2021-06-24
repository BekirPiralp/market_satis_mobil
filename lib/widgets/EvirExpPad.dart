import 'package:flutter/material.dart';
/*class EvirExpPad extends StatefulWidget {
  Widget child = Text("");
  int flex=1;
  EvirExpPad({Key key,this.child,this.flex}) : super(key: key);

  @override
  _EvirExpPadState createState() => _EvirExpPadState(child,flex);
}*/

class EvirExpPad extends StatelessWidget {
  Widget child;
  int flex=1;
  EvirExpPad({Key key,this.child,this.flex}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: this.child,
      ),
    );
  }
}
