import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/centered_view.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_bar.dart';
import 'package:health_care_azhar/views/navigation_drawer/navigation_drawer.dart';

import '../contents/content.dart';
import 'dashboard_admin_view.dart';
import 'dashboard_doctor_view.dart';
import 'dashboard_patiant_view.dart';


class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: CenteredView(Column(
          children: [
            // navigation bar
            NavigationBar(),

            Text("Dashboard",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'Anton'
              ),
            ),
            SizedBox(height: 30,),

            if (Manager.currentUserType == Manager.USERTYPE_ADMIN)
              DashboardAdminView(),
            if (Manager.currentUserType == Manager.USERTYPE_PATIANT)
              DashboardPatiantView(),
            if (Manager.currentUserType == Manager.USERTYPE_DOCTOR)
              DashboardDoctorView(),

          ],
        )
        )
    );
  }
}
