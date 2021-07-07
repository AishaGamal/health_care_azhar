import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/centered_view.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_bar.dart';
import 'package:health_care_azhar/views/navigation_drawer/navigation_drawer.dart';

import '../contents/content.dart';
import 'message_form.dart';


class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: CenteredView(Column(
          children: [
            // navigation bar
            NavigationBar(),

            Text("About Us",
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


            SizedBox(height: 60,),
            MessageForm(),
            SizedBox(height: 60,),
          ],
        )
        )
    );
  }
}
