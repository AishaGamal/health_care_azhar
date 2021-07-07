import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.blueAccent,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("Health Care System",textAlign:TextAlign.center, style: TextStyle(fontSize: 40,fontFamily: 'Anton'),)
        ],
      ),
    );
  }
}
