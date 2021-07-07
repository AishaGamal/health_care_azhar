import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/centered_view.dart';
import 'package:health_care_azhar/views/centered_view/sized_centered_view.dart';
import 'package:health_care_azhar/views/dashboard/dashboard_side_item.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_bar.dart';
import 'package:health_care_azhar/views/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../router_manager.dart';
import '../contents/content.dart';
import 'admin/admin_doctor_requests.dart';
import 'admin/admin_messages.dart';
import 'admin/admin_status.dart';
import 'admin/admin_user_edit.dart';


class DashboardAdminView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _DashboardAdminMobile(),
      tablet: _DashboardAdminDesktop(),
    );
  }
}

class _DashboardAdminMobile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

class _DashboardAdminDesktop extends StatelessWidget{
  dynamic childView = null;

  @override
  Widget build(BuildContext context) {
    if (Manager.currentUserType == Manager.USERTYPE_ADMIN)
      childView = AdminStatus();

    if (RouterManager.getCurrentPath(context) == RouterManager.dashboard_doctors_request_route)
      childView = AdminRequests();
    if (RouterManager.getCurrentPath(context) == RouterManager.dashboard_messages_route)
      childView = AdminMessages();
    if (RouterManager.getCurrentPath(context) == RouterManager.dashboard_message_details_route)
      childView = AdminMessages();
    if (RouterManager.getCurrentPath(context) == RouterManager.dashboard_edit_users_route)
      childView = AdminUsers();
    if (RouterManager.getCurrentPath(context) == RouterManager.dashboard_patiant_details_route)
      childView = AdminUsers();
    // if (RouterManager.getCurrentPath(context) == RouterManager.dashboard_devices_route)
    //   childView = AdminDevices();



    return SingleChildScrollView(
        child: Container(
          child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color:Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 12)]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardItem('Summary', RouterManager.dashboard_home_route),
                  SizedBox(height: 30,),

                  DashboardItem('Doctors Requests', RouterManager.dashboard_doctors_request_route),
                  SizedBox(height: 30,),

                  DashboardItem('Users Edit', RouterManager.dashboard_edit_users_route),
                  SizedBox(height: 30,),

                  DashboardItem('Devices', RouterManager.dashboard_devices_route),
                  SizedBox(height: 30,),

                  DashboardItem('Messages', RouterManager.dashboard_messages_route),
                  SizedBox(height: 30,),

                ],
              ),
            ),
            SizedCenteredView(
              0,0,
              childView,
              maxWidth: 1000,
            )
      ],
    ),
        ));
  }

}
