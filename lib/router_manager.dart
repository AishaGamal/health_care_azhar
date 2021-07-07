

import 'dart:html';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_care_azhar/views/about/about_view.dart';
import 'package:health_care_azhar/views/dashboard/dashboard_view.dart';
import 'package:health_care_azhar/views/doctor_signup/doctor_signup_view.dart';
import 'package:health_care_azhar/views/home/home_view.dart';
import 'package:health_care_azhar/views/login/login_view.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:health_care_azhar/views/patiant_signup/patiant_signup_view.dart';
import 'package:health_care_azhar/views/services/services_view.dart';

class RouterManager
{
  static FluroRouter router = FluroRouter();

  static String home_route = "/";
  static String about_route = "/about";
  static String services_route = "/services";
  static String login_route = "/login";
  static String register_patianet_route = "/signup";
  static String register_doctor_route = "/docsignup";
  static String dashboard_route = "/dashboard";
  static String logout_route = "/logout";

  static String dashboard_home_route = dashboard_route;
  static String dashboard_doctors_request_route = "/dashboard?panel=docreq";
  static String dashboard_edit_users_route = "/dashboard?panel=edituser";
  static String dashboard_messages_route = "/dashboard?panel=messages";
  static String dashboard_devices_route = "/dashboard?panel=devices";
  static String dashboard_message_details_route = "/dashboard?panel=message_details";
  static String dashboard_patiant_details_route = "/dashboard?panel=user_details";


  static void setupRouter ()
  {
    router.define(home_route, handler: Handler(handlerFunc: (context,params){return HomeView();}));
    router.define(about_route, handler: Handler(handlerFunc: (context,params){return AboutView();}));
    router.define(services_route, handler: Handler(handlerFunc: (context,params){return ServicesView();}));
    router.define(login_route, handler: Handler(handlerFunc: (context,params){return LoginView();}));
    router.define(register_patianet_route, handler: Handler(handlerFunc: (context,params){return PatiantSignupView();}));
    router.define(register_doctor_route, handler: Handler(handlerFunc: (context,params){return DoctorSignupView();}));
    router.define(dashboard_route, handler: Handler(handlerFunc: (context,params){return DashboardView();}));
    router.define(logout_route, handler: Handler(handlerFunc: (context,params){
      Manager.isLogedIn = false;
      Manager.currentUserEmail = "";
      Manager.currentUserId = 0;
      Manager.currentUserType = "";
      Manager.currentUserData = null;
      Manager.saveCurrentData();
      //RouterManager.router.pop(context!);
      RouterManager.router.navigateTo(context!, RouterManager.home_route);
      window.location.reload();
    }));

    router.define(dashboard_home_route, handler: Handler(handlerFunc: (context,params){return DashboardView();}));

    router.define(dashboard_doctors_request_route, handler: Handler(handlerFunc: (context,params){return Manager.currentUserType==Manager.USERTYPE_ADMIN?DashboardView():null;}));
    router.define(dashboard_edit_users_route, handler: Handler(handlerFunc: (context,params){return Manager.currentUserType==Manager.USERTYPE_ADMIN?DashboardView():null;}));
    router.define(dashboard_patiant_details_route, handler: Handler(handlerFunc: (context,params){return Manager.currentUserType==Manager.USERTYPE_ADMIN?DashboardView():null;}));
    router.define(dashboard_messages_route, handler: Handler(handlerFunc: (context,params){return Manager.currentUserType==Manager.USERTYPE_ADMIN?DashboardView():null;}));
    router.define(dashboard_message_details_route, handler: Handler(handlerFunc: (context,params) {return Manager.currentUserType==Manager.USERTYPE_ADMIN?DashboardView():null;}));
    router.define(dashboard_devices_route, handler: Handler(handlerFunc: (context,params){return Manager.currentUserType==Manager.USERTYPE_ADMIN?DashboardView():null;}));


  }

  static String getCurrentPath (BuildContext context)
  {
    String? currentPath = ModalRoute.of(context)!.settings.name;
    return currentPath.toString();
  }

  static bool isCurrentPathEqual (BuildContext context,String path)
  {
    String? currentPath = ModalRoute.of(context)!.settings.name;
    if (currentPath == path)
    {
        return true;
    }
    else
      return false;
  }


}