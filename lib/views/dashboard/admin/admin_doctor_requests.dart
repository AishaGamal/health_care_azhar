import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/database_manager/doctors_manager.dart';
import 'package:health_care_azhar/views/database_manager/patiants_manager.dart';
import 'package:health_care_azhar/views/database_manager/readings_manager.dart';

class AdminRequests extends StatefulWidget {
  const AdminRequests({Key? key}) : super(key: key);

  @override
  _AdminRequestsState createState() => _AdminRequestsState();
}

class _AdminRequestsState extends State<AdminRequests> {
  String doctorsCount = "";
  String doctorsRequestsCount="";
  List<dynamic> doctorsRequests = [];

  @override
  Widget build(BuildContext context) {

    DoctorsManager.table.getDatabaseRef().onValue.listen((event) {
      int count = int.parse(event.value["count"].toString());
      doctorsCount = event.value["approved_count"].toString();
      doctorsRequestsCount = event.value["requests_count"].toString();
      doctorsRequests.clear();
      for(int i=1; i<=count; i++)
        {
          if(event.value[i.toString()]["approved"].toString() == "false")
            {
              dynamic v = event.value[i.toString()];
              v["id"] = i.toString();
              doctorsRequests.add(v);
            }
        }
      setState(() {});
    });

    List<_AdminRequestElement> elements = [];
    for (var request in doctorsRequests)
      {
        elements.add(_AdminRequestElement(request["full_name"], request));
      }

    return Container(
      alignment: Alignment.topCenter,
      child: Column(

        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Requests",style: TextStyle(fontSize: 30),),
          SizedBox(height: 50,),

          Column(
            children: elements,
          )

        ],
      ),
    );
  }
}

class _AdminRequestElement extends StatelessWidget {
  final String title;
  final dynamic data;
  const _AdminRequestElement(this.title,this.data);

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
                int requestsCount = await DoctorsManager.getRequestsCount();
                int count = await DoctorsManager.table.getCount();

                count--;
                requestsCount--;

                DoctorsManager.table.setCount(count);
                DoctorsManager.setRequestsCount(requestsCount);
                DoctorsManager.table.remove(data["id"].toString());

              }, icon: Icon(Icons.remove)),
              IconButton(onPressed: () async{
                int approvalCount = await DoctorsManager.getApprovedCount();
                int requestsCount = await DoctorsManager.getRequestsCount();

                approvalCount++;
                requestsCount--;
                DoctorsManager.setApprovedCount(approvalCount);
                DoctorsManager.setRequestsCount(requestsCount);

                DoctorsManager.updateDoctor(data["id"].toString(),
                    data["full_name"].toString(), data["email"].toString(),
                    data["password"].toString(), data["address"].toString(),
                    data["nid"].toString(), data["speciality"].toString(),
                    data["working_hours"].toString(), data["location"].toString(),approved:true);
              }, icon: Icon(Icons.approval)),
            ],
          )
        ],
      ),
    );
  }
}
