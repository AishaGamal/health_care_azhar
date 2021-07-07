import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/database_manager/doctors_manager.dart';
import 'package:health_care_azhar/views/database_manager/messages_manager.dart';
import 'package:health_care_azhar/views/database_manager/patiants_manager.dart';
import 'package:health_care_azhar/views/database_manager/readings_manager.dart';
import 'package:health_care_azhar/views/manager/manager.dart';

import '../../../router_manager.dart';

class AdminUsers extends StatefulWidget {

  @override
  _AdminUsersState createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {

  String usersCount = "";
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {

    PatiantsManager.table.getDatabaseRef().onValue.listen((event) {
      int count = int.parse(event.value["count"].toString());
      users.clear();
      int key = 1;
      for(int i=0; i<count; i++)
      {
        if (event.value[key.toString()] == null)
        {
          i--;
          key++;
        }
        else {
          dynamic v = event.value[key.toString()];
          v["id"] = key.toString();
          users.add(v);
          key++;
        }
      }
      setState(() {});
    });

    dynamic data = ModalRoute.of(context)!.settings.arguments;
    List<Widget> elements = [];
    if (data == null) {
      for (var request in users) {
        elements.add(_UserElement(request["full_name"], request));
      }
    }
    else
    {
      elements.add(_UserDetails(data));
    }

    return Container(
      alignment: Alignment.topCenter,
      child: Column(

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Patiants Data",style: TextStyle(fontSize: 30),),
          SizedBox(height: 50,),

          Column(
            children: elements,
          )

        ],
      ),
    );
  }
}

class _UserElement extends StatelessWidget {
  final String title;
  final dynamic data;
  const _UserElement(this.title,this.data);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(boxShadow: [BoxShadow(color:Colors.black12,blurRadius: 12)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 30,fontFamily: 'Anton'),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () async {
                int count = await PatiantsManager.table.getCount();
                count--;
                PatiantsManager.table.setCount(count);
                PatiantsManager.table.remove(data["id"].toString());

              }, icon: Icon(Icons.remove)),
              IconButton(onPressed: () async{
                RouteSettings settings = RouteSettings(name:ModalRoute.of(context)!.settings.name,arguments: data);
                RouterManager.router.navigateTo(context, RouterManager.dashboard_patiant_details_route,routeSettings: settings);
              }, icon: Icon(Icons.view_agenda)),
            ],
          )
        ],
      ),
    );
  }
}

class _UserDetails extends StatelessWidget {
  dynamic data;
  _UserDetails(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(children: [Text("Full Name",style:TextStyle(fontSize: 20,fontFamily: "Anton")),
            SizedBox(width: 30,), Text(data["full_name"],style:TextStyle(fontSize: 16)),]),
          SizedBox(height: 30,),

          Row(children: [Text("Email",style:TextStyle(fontSize: 20,fontFamily: "Anton")),
            SizedBox(width: 30,), Text(data["email"],style:TextStyle(fontSize: 16)),]),
          SizedBox(height: 30,),

          Row(children: [Text("Device ID",style:TextStyle(fontSize: 20,fontFamily: "Anton")),
            SizedBox(width: 30,), Text(data["device_id"],style:TextStyle(fontSize: 16)),]),
          SizedBox(height: 30,),

          Row(children: [Text("Age",style:TextStyle(fontSize: 20,fontFamily: "Anton")),
            SizedBox(width: 30,), Text(data["age"],style:TextStyle(fontSize: 16)),]),
          SizedBox(height: 30,),


        ],
      ),
    );
  }
}
