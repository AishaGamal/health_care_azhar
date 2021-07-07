import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'database_manager.dart';
import 'database_table_abstract.dart';

class MessagesManager
{
  static DatabaseTable table = DatabaseTable("Messages");

  static void addMessage (String name, String email, String subject,String message,String phone) async
  {
    Map<String,dynamic> vals = {"full_name":name,"email":email,"message":message,"phone":phone,"subject":subject};
    table.add(vals);
  }

}