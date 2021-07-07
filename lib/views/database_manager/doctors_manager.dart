import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'database_manager.dart';
import 'database_table_abstract.dart';

class DoctorsManager
{
  static DatabaseTable table = DatabaseTable("Doctors");

  static void addDoctor (String name, String email, String password,String address,String nid,String speciality,String working_hours,String location,{bool approved=false}) async
  {
    Map<String,dynamic> vals = {"address":address,"approved":approved,"email":email,"full_name":name,"location":location,"nid":nid,"password":password,"speciality":speciality,"working_hours":working_hours};
    table.add(vals);
  }

  static void updateDoctor (String key,String name, String email, String password,String address,String nid,String speciality,String working_hours,String location,{bool approved=false}) async
  {
    Map<String,dynamic> vals = {"address":address,"approved":approved,"email":email,"full_name":name,"location":location,"nid":nid,"password":password,"speciality":speciality,"working_hours":working_hours};
    table.update(key,vals);
  }

  static Future<int> getApprovedCount () async
  {
    int count = -1;
    String res = await getString("Doctors/approved_count");
    if (res == "null") {count = 0;}
    else{ count = int.parse(res);}
    return count;
  }
  static void setApprovedCount (int newCount)
  {
    FirebaseDatabaseWeb.instance.reference().child("Doctors/approved_count")
        .set(newCount);
  }

  static Future<int> getRequestsCount () async
  {
    int count = -1;
    String res = await getString("Doctors/requests_count");
    if (res == "null") {count = 0;}
    else{ count = int.parse(res);}
    return count;
  }
  static void setRequestsCount (int newCount)
  {
    FirebaseDatabaseWeb.instance.reference().child("Doctors/requests_count")
        .set(newCount);
  }

  static dynamic getDoctorByEmail (String email) async
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