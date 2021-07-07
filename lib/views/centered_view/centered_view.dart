import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  double maxWidth;
  CenteredView(this.child,{this.maxWidth=1200});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:0,horizontal: 70),
        alignment: Alignment.topCenter,
        child: ConstrainedBox
          (
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
