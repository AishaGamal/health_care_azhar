import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'database_manager.dart';
import 'database_table_abstract.dart';

class ChatsManager
{
  static DatabaseTable table = DatabaseTable("Chats");

  static void addChat (String from, String to, String message) async
  {
    Map<String,dynamic> vals = {"from":from,"to":to,"message":message,"timestamp":DateTime.now().millisecondsSinceEpoch};
    table.add(vals);
  }

  static dynamic getChatByDoctorId (String doctor_id,String patiant_id) async
  {
    Map<String,dynamic> result = {};
    Map<String,dynamic> chats = await table.getTableMap();
    chats.forEach((id, chat) {
      if (((chat["from"].toString()) == doctor_id && (chat["to"].toString()) == patiant_id)
          || ((chat["from"].toString()) == patiant_id && (chat["to"].toString()) == doctor_id))
        {
          result[chat["timestamp"]] = chat;
        }
    });
    return result;
  }




}
