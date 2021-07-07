import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:health_care_azhar/router_manager.dart';
import 'package:health_care_azhar/views/about/about_view.dart';
import 'package:health_care_azhar/views/database_manager/database_manager.dart';
import 'package:health_care_azhar/views/home/home_view.dart';
import 'package:health_care_azhar/views/login/login_view.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:health_care_azhar/views/services/services_view.dart';

void main() {
  FirebaseHelper.initDatabase();
  setUrlStrategy(PathUrlStrategy());
  RouterManager.setupRouter();
  Manager.initManager();
  runApp(HealthCare());
}


class HealthCare extends StatelessWidget {
  const HealthCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Health Care System",
      initialRoute: "/",
      onGenerateRoute: RouterManager.router.generator,
    );
  }
}
