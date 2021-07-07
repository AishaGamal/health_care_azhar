import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/centered_view.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_bar.dart';
import 'package:health_care_azhar/views/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../router_manager.dart';
import '../contents/content.dart';


class ServicesView extends StatelessWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: CenteredView(Column(
          children: [
            // navigation bar
            NavigationBar(),

            Text("Our Services",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'Anton'
              ),
            ),
            SizedBox(height: 30,),

            Content('lsfdahslkjfh kadsfh laksdjf kljh lkdsjfh ','assets/images/logo.png',true),
            Content('lsfdahslkjfjhsd  dsfhkj ahjkdsjfh ','assets/images/logo.png',false),

          Container(
            child: ScreenTypeLayout(
              mobile: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "If you ant to join our doctors ,,,,,,,",
                    style: TextStyle(fontSize: 30,fontFamily: 'Anton'),
                  ),
                  ElevatedButton(onPressed: (){
                    RouterManager.router.navigateTo(context, RouterManager.register_doctor_route);
                  }, child: Text("Join Our Doctors",style: TextStyle(fontSize: 30),)),
                ],
              ),
            ),
          )
          ],
        )
        )
    );
  }
}
