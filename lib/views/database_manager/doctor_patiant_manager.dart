import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/cupertino.dart';
import 'database_manager.dart';
import 'database_table_abstract.dart';

class DoctorsPatiantsManager
{
  static DatabaseTable table = DatabaseTable("Doctor_Patiant");

  static void addDoctorPatiant (String doctor_id, String patiant_id, {bool approved=false}) async
  {
    Map<String,dynamic> vals = {"doctor_id":doctor_id,"patiant_id":patiant_id,"approved":approved};
    table.add(vals);
  }

  static dynamic getDoctorPatiantData (String doctor_id,String patiant_id) async
  {
    dynamic result = null;
    Map<String,dynamic> admins = await table.getTableMap();
    admins.forEach((id, adminData) {
      if (doctor_id == (adminData["doctor_id"].toString())
      && patiant_id == (adminData["patiant_id"].toString()))
      {
        result =  adminData;
      }
    });
    return result;
  }

}