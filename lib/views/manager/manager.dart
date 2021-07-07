import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care_azhar/views/manager/web_storage.dart';


class Manager
{

  static const String KEY_ISLOGGEDIN = 'isLoggedIn';
  static const String KEY_USEREMAIL = 'userEmail';
  static const String KEY_USERID = 'userId';
  static const String KEY_USERTYPE = 'userType';
  static const String KEY_USERDATA = 'userData';


  static const String USERTYPE_PATIANT = "patiant";
  static const String USERTYPE_DOCTOR = "doctor";
  static const String USERTYPE_ADMIN = "admin";

  static bool isLogedIn = false;
  static int currentUserId = 0;
  static String currentUserEmail = "";
  static String currentUserType = "";
  static dynamic currentUserData = "";

  static dynamic messageData = null;

  static void initManager ()
  {
    isLogedIn = WebStorage.getKey(KEY_ISLOGGEDIN)=="true"?true:false;
    currentUserId = int.parse(WebStorage.getKey(KEY_USERID)==""?"0":WebStorage.getKey(KEY_USERID));
    currentUserEmail = WebStorage.getKey(KEY_USEREMAIL);
    currentUserType = WebStorage.getKey(KEY_USERTYPE);
    if (WebStorage.getKey(KEY_USERDATA) != "")
      currentUserData = jsonDecode(WebStorage.getKey(KEY_USERDATA));
    else
      currentUserData = null;
  }
  
  static void saveCurrentData ()
  {
    WebStorage.setKey(KEY_ISLOGGEDIN, isLogedIn.toString());
    WebStorage.setKey(KEY_USERID, currentUserId.toString());
    WebStorage.setKey(KEY_USEREMAIL, currentUserEmail.toString());
    WebStorage.setKey(KEY_USERTYPE, currentUserType.toString());
    WebStorage.setKey(KEY_USERDATA, jsonEncode(currentUserData));
    
  }

  static void showErrorMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
      webBgColor: '#ff0000',
      webPosition: 'center',
    );
  }

  static void showSuccessMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
      webBgColor: '#00ff00',
      webPosition: 'center',
    );
  }


}