import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_logo.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: Icon(Icons.menu)),
          NavigationBarLogo()

        ],
      ),
    );
  }
}
