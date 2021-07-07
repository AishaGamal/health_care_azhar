import 'package:flutter/material.dart';
import 'package:health_care_azhar/router_manager.dart';
import 'package:health_care_azhar/views/manager/manager.dart';

import 'navigation_item.dart';
import 'navigation_logo.dart';

class NavigationBarDesktop extends StatelessWidget {
  const NavigationBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          // logo
          NavigationBarLogo(),

          // menu items
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // home
              NavigationItem('Home',RouterManager.home_route),
              SizedBox(width: 60,),
              // about
              NavigationItem('About',RouterManager.about_route),
              SizedBox(width: 60,),
              // services
              NavigationItem('Services',RouterManager.services_route),
              SizedBox(width: 60,),
              // login
              if (Manager.isLogedIn == false)
                NavigationItem('Login',RouterManager.login_route),
              if (Manager.isLogedIn)
                NavigationItem('Dashboard',RouterManager.dashboard_route),
              SizedBox(width: 60,),
              if (Manager.isLogedIn)
                NavigationItem('Logout',RouterManager.logout_route),
            ],
          )
        ],
      ),
    );
  }
}
