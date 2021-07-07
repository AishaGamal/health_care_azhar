import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/centered_view.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_bar.dart';
import 'package:health_care_azhar/views/navigation_drawer/navigation_drawer.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: Colors.white,
      body: CenteredView(Column(
        children: [
          // navigation bar
          NavigationBar(),

          // welcome text
          Text("Welcome To Health Care System",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 80,
                fontFamily: 'Anton'
            ),
          ),
          SizedBox(height: 30,),

          // device image
          SizedBox(
            height: 150,
            child: Image.asset("assets/images/device_image.png"),
          ),

          SizedBox(height: 30,),
          // text paragraph about the device
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style:TextStyle(
                  color:Colors.blueAccent[100],
                  fontSize: 20,
                  fontFamily: 'NotoSans'
              )
          )
        ],
      )
      )
    );
  }
}
