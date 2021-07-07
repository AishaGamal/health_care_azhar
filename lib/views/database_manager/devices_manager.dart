import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'database_manager.dart';
import 'database_table_abstract.dart';

class DevicesManager
{
  static DatabaseTable table = DatabaseTable("Devices");

  static void addDevice (String device_id) async
  {
    Map<String,dynamic> vals = {"device_id":device_id};
    table.add(vals);
  }

  static dynamic getDeviceByDeviceId (String device_id) async
  {
    dynamic result = null;
    Map<String,dynamic> admins = await table.getTableMap();
    admins.forEach((id, adminData) {
      if (device_id == (adminData["device_id"].toString()))
      {
        result =  adminData;
      }
    });
    return result;
  }






}