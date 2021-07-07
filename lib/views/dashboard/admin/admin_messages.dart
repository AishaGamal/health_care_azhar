import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/database_manager/doctors_manager.dart';
import 'package:health_care_azhar/views/database_manager/messages_manager.dart';
import 'package:health_care_azhar/views/database_manager/patiants_manager.dart';
import 'package:health_care_azhar/views/database_manager/readings_manager.dart';
import 'package:health_care_azhar/views/manager/manager.dart';

import '../../../router_manager.dart';

class AdminMessages extends StatefulWidget {

  @override
  _AdminMessagesState createState() => _AdminMessagesState();
}

class _AdminMessagesState extends State<AdminMessages> {

  String messagesCount = "";
  List<dynamic> messages = [];

  @override
  Widget build(BuildContext context) {

    MessagesManager.table.getDatabaseRef().onValue.listen((event) {
      int count = int.parse(event.value["count"].toString());
      messages.clear();
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
          messages.add(v);
          key++;
        }
      }
      setState(() {});
    });

    dynamic data = Manager.messageData;
    data = ModalRoute.of(context)!.settings.arguments;
    List<Widget> elements = [];
    if (data == null) {
      for (var request in messages) {
        elements.add(_MessageElement(request["subject"], request));
      }
    }
    else
      {
        elements.add(_MessageDetails(data));
      }

    return Container(
      alignment: Alignment.topCenter,
      child: Column(

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Messages",style: TextStyle(fontSize: 30),),
          SizedBox(height: 50,),

          Column(
            children: elements,
          )

        ],
      ),
    );
  }
}

class _MessageElement extends StatelessWidget {
  final String title;
  final dynamic data;
  const _MessageElement(this.title,this.data);

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
                int count = await MessagesManager.table.getCount();
                count--;
                MessagesManager.table.setCount(count);
                MessagesManager.table.remove(data["id"].toString());

              }, icon: Icon(Icons.remove)),
              IconButton(onPressed: () async{
                Manager.messageData = data;
                RouteSettings settings = RouteSettings(name:ModalRoute.of(context)!.settings.name,arguments: data);
                RouterManager.router.navigateTo(context, RouterManager.dashboard_message_details_route,routeSettings: settings);
              }, icon: Icon(Icons.view_agenda)),
            ],
          )
        ],
      ),
    );
  }
}

class _MessageDetails extends StatelessWidget {
  dynamic data;
  _MessageDetails(this.data);

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

          Row(children: [Text("Phone",style:TextStyle(fontSize: 20,fontFamily: "Anton")),
            SizedBox(width: 30,), Text(data["phone"],style:TextStyle(fontSize: 16)),]),
          SizedBox(height: 30,),

          Row(children: [Text("Subject",style:TextStyle(fontSize: 20,fontFamily: "Anton")),
            SizedBox(width: 30,), Text(data["subject"],style:TextStyle(fontSize: 16)),]),
          SizedBox(height: 30,),

          Row(children: [Text("Message",style:TextStyle(fontSize: 20,fontFamily: "Anton")),
            SizedBox(width: 30,), Text(data["message"],style:TextStyle(fontSize: 16)),]),
          SizedBox(height: 30,),



        ],
      ),
    );
  }
}
