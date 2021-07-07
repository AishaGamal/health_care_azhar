import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_item.dart';

class NavigationDrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String path;
  const NavigationDrawerItem(this.title,this.icon,this.path);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left:30,top:60),child: Row(
      children: [
        Icon(icon),
        SizedBox(width: 30,),
        NavigationItem(title,path)
      ],
    ),
    );
  }
}
