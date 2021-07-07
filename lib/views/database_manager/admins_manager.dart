import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'database_manager.dart';
import 'database_table_abstract.dart';

class AdminsManager
{
  static DatabaseTable table = DatabaseTable("Admins");

  static void addAdmin (String name, String email, String password) async
  {
    Map<String,dynamic> vals = {"full_name":name,"email":email,"password":password};
    table.add(vals);
  }

  static void updateAdmin (String key,String name, String email, String password) async
  {
    Map<String,dynamic> vals = {"full_name":name,"email":email,"password":password};
    table.update(key,vals);
  }

  static dynamic getAdminByEmail (String email) async
  {
    dynamic result = null;
    Map<String,dynamic> admins = await table.getTableMap();
    admins.forEach((id, adminData) {
      if (email == (adminData["email"].toString()))
        {
          result =  adminData;
          result['id'] = id;
        }
    });
    return result;
  }



}