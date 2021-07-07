import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/centered_view.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_bar.dart';
import 'package:health_care_azhar/views/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../contents/content.dart';


class DashboardDoctorView extends StatelessWidget {
  const DashboardDoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _DashboardDoctorMobile(),
      tablet: _DashboardDoctorDesktop(),
    );
  }
}

class _DashboardDoctorMobile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

class _DashboardDoctorDesktop extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
