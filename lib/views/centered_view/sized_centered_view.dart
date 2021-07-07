import 'package:flutter/material.dart';

class SizedCenteredView extends StatelessWidget {
  final Widget child;
  final double paddingVertial;
  final double paddingHorizental;
  double maxWidth;
  SizedCenteredView(this.paddingHorizental,this.paddingVertial,this.child,{this.maxWidth=1200});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:paddingVertial,horizontal: paddingHorizental),
      alignment: Alignment.topCenter,
      child: ConstrainedBox
        (
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
