import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'database_manager.dart';
import 'database_table_abstract.dart';

class PatiantsManager
{
  static const int SHIFT = 100000;
  static DatabaseTable table = DatabaseTable("Patiants");

  static Future<Map<String,dynamic>> getPatiants () async
  {
    return await table.getTableMap(shift: SHIFT);
  }
  static void addPatiant (String name, String email, String password,String device_id,String age) async
  {
    Map<String,dynamic> vals = {"full_name":name,"email":email,"password":password,"age":age,"device_id":device_id};
    table.add(vals,shift: SHIFT);
  }

  static void updatePatiant (String key,String name, String email, String password,String device_id,String age) async
  {
    Map<String,dynamic> vals = {"full_name":name,"email":email,"password":password,"age":age,"device_id":device_id};
    table.update(key,vals);
  }

  static dynamic getPatiantByEmail (String email) async
  {
    dynamic result = null;
    Map<String,dynamic> admins = await table.getTableMap(shift: SHIFT);
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