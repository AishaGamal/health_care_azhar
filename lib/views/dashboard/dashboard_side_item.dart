import 'package:flutter/material.dart';

import '../../router_manager.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final String path;
  const DashboardItem(this.title,this.path);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){RouterManager.router.navigateTo(context, path);},
      child: Container(
        child: Text(title,style: TextStyle(fontSize: 18,color: RouterManager.isCurrentPathEqual(context,path)?Colors.blueAccent:Colors.black),),
      ),
    );
  }
}
