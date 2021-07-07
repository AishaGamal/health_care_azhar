import 'dart:convert';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firebase.dart';
import 'package:firebase_db_web_unofficial/DatabaseSnapshot.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';


//Replace These Values With Yours
class FirebaseHelper  {
  static fb.Database initDatabase() {
    try {
      if (fb.apps.isEmpty) {
        fb.initializeApp(
            apiKey: "AIzaSyAyP3_FN7CoSoucTmcl30oc6KiiULev8So",
            authDomain: "flutterweb-2463a.firebaseapp.com",
            databaseURL: "https://flutterweb-2463a-default-rtdb.firebaseio.com",
            projectId: "flutterweb-2463a",
            storageBucket: "flutterweb-2463a.appspot.com",
            messagingSenderId: "660278896286",
            appId: "1:660278896286:web:9c6340926fff2e9f773d8f"
        );
      }
    } on fb.FirebaseJsNotLoadedException catch (e) {
      print(e);
    }
    return fb.database();
  }
}

Future<String> getString (String path) async
{
  dynamic result = "";
  await FirebaseDatabaseWeb.instance.reference().child(path).once().then(
          (value) => {result = value.value});
  if (result == null)
    {
      return "null";
    }
  return result.toString();
}

Future<Object> getList(String path) async {
  DatabaseSnapshot snapshot = await FirebaseDatabaseWeb.instance.reference().child(path).once();
  return snapshot.value;
}

Map<String,dynamic> convertToMap (dynamic value, {int countShift=0})
{
  int count = value['count'];
  Map<String,dynamic> result = {};
  int key = 1;
  for(int i=0; i<count; i++)
  {
    if (value[(key+countShift).toString()] == null)
    {
      i--;
      key++;
    }
    else {
      result[(key+countShift).toString()] = value[(key+countShift).toString()];
      key++;
    }
  }
  return result;
}