

import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';

import 'database_manager.dart';

class DatabaseTable
{
  String RootPath = "";
  String CountPath = "";

  DatabaseTable(String rootPath)
  {
    RootPath = rootPath;
    CountPath = rootPath + "/count";
  }
  Future<int> getCount () async
  {
    int count = -1;
    String res = await getString(CountPath);
    if (res == "null") {count = 0;}
    else{ count = int.parse(res);}
    return count;
  }

  DatabaseRef getDatabaseRef ()
  {
    return FirebaseDatabaseWeb.instance.reference().child(RootPath);
  }

  void setCount (int newCount)
  {
    FirebaseDatabaseWeb.instance.reference().child(CountPath)
        .set(newCount);
  }

  Future<Map<String,dynamic>> getTableMap ({int shift=0}) async
  {
    Map<String,dynamic> result;
    result = convertToMap(await getList(RootPath),countShift: shift);
    return result;
  }

  void add (Map<String,dynamic> values,{int shift=0}) async
  {
    int count = await getCount();
    count++;
    setCount(count);

    FirebaseDatabaseWeb.instance.reference()
        .child(RootPath)
        .child((shift+count).toString())
        .set(values);
  }

  void update (String key,Map<String,dynamic> values) async
  {
    FirebaseDatabaseWeb.instance.reference()
        .child(RootPath)
        .child(key)
        .set(values);
  }

  void remove (String key) async
  {
    FirebaseDatabaseWeb.instance.reference()
        .child(RootPath)
        .child(key)
        .remove();
  }

}