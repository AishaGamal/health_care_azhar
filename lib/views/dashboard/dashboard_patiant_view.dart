import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/centered_view.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_bar.dart';
import 'package:health_care_azhar/views/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../contents/content.dart';


class DashboardPatiantView extends StatelessWidget {
  const DashboardPatiantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _DashboardPatiantMobile(),
      tablet: _DashboardPatiantDesktop(),
    );
  }
}

class _DashboardPatiantMobile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

class _DashboardPatiantDesktop extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
