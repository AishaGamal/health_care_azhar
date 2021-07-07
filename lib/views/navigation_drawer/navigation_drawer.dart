import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../router_manager.dart';
import 'navigation_drawer_header.dart';
import 'navigation_drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Container(
        width: 300,
        decoration: BoxDecoration(
            color:Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 12)]
        ),
        child: Column(
          children: [
            NavigationDrawerHeader(),
            NavigationDrawerItem('Home',Icons.home,RouterManager.home_route),
            NavigationDrawerItem('About',Icons.help,RouterManager.about_route),
            NavigationDrawerItem('Services',Icons.alarm_on,RouterManager.services_route),
            if (Manager.isLogedIn == false)
              NavigationDrawerItem('Login',Icons.login,RouterManager.login_route),
            if (Manager.isLogedIn)
              NavigationDrawerItem('Dashboard',Icons.dashboard,RouterManager.dashboard_route),
            SizedBox(width: 60,),
            if (Manager.isLogedIn)
              NavigationDrawerItem('Logout',Icons.logout,RouterManager.logout_route),
          ],
        ),
      ),
      tablet: null,
    );
  }
}
