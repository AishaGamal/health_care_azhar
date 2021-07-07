import 'dart:html';

import 'package:flutter/material.dart';

class WebStorage {

  //Singleton
  WebStorage._internal();
  static final WebStorage instance = WebStorage._internal();
  factory WebStorage() {
    return instance;
  }

  static void setKey (String key, String value)
  {
    if (value == null)
      window.localStorage.remove(key);
    else
      window.localStorage[key]=value;
  }

  static String getKey (String key)
  {
    return window.localStorage[key]==null?"":window.localStorage[key].toString();
  }
}