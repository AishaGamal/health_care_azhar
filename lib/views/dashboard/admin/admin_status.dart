import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/database_manager/doctors_manager.dart';
import 'package:health_care_azhar/views/database_manager/patiants_manager.dart';
import 'package:health_care_azhar/views/database_manager/readings_manager.dart';

class AdminStatus extends StatefulWidget {
  const AdminStatus({Key? key}) : super(key: key);

  @override
  _AdminStatusState createState() => _AdminStatusState();
}

class _AdminStatusState extends State<AdminStatus> {
  String userCount = "";
  String doctorsCount = "";
  String doctorsRequestsCount="";
  String readingsCount = "";

  @override
  Widget build(BuildContext context) {
    PatiantsManager.table.getDatabaseRef().onValue.listen((event) {
      userCount = event.value["count"].toString();
      setState(() {});
    });
    DoctorsManager.table.getDatabaseRef().onValue.listen((event) {
      doctorsCount = event.value["approved_count"].toString();
      doctorsRequestsCount = event.value["requests_count"].toString();
      setState(() {});
    });
    ReadingsManager.table.getDatabaseRef().onValue.listen((event) {
      readingsCount = event.value["count"].toString();
      setState(() {});
    });

    return Container(
      alignment: Alignment.topCenter,
      child: Column(

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Statistics",style: TextStyle(fontSize: 30),),
          SizedBox(height: 50,),

          Center( child: Container(padding:EdgeInsets.all(20),child: Row( children: [Text("Users Count: ",style: TextStyle(fontSize: 40),), SizedBox(width:30,), Text(userCount,style: TextStyle(fontSize: 40),),]))),
          Center(child: Container(padding:EdgeInsets.all(20),child: Row(children: [Text("Readings Count: ",style: TextStyle(fontSize: 40),), SizedBox(width:30,), Text(readingsCount,style: TextStyle(fontSize: 40),),]))),
          Center(child: Container(padding:EdgeInsets.all(20),child: Row(children: [Text("Doctors Count: ",style: TextStyle(fontSize: 40),), SizedBox(width:30,), Text(doctorsCount,style: TextStyle(fontSize: 40),),]))),
          Center(child: Container(padding:EdgeInsets.all(20),child: Row(children: [Text("Doctors Requests Count: ",style: TextStyle(fontSize: 40),), SizedBox(width:30,), Text(doctorsRequestsCount,style: TextStyle(fontSize: 40),),]))),
        ],
      ),
    );
  }
}
