import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/centered_view.dart';
import 'package:health_care_azhar/views/centered_view/sized_centered_view.dart';
import 'package:health_care_azhar/views/contents/content.dart';
import 'package:health_care_azhar/views/navigation_bar/navigation_bar.dart';
import 'package:health_care_azhar/views/navigation_drawer/navigation_drawer.dart';
import 'package:health_care_azhar/views/patiant_signup/patiant_signup_form.dart';


class PatiantSignupView extends StatelessWidget {
  const PatiantSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: CenteredView(Column(
          children: [
            // navigation bar
            NavigationBar(),
            PatiantSignupForm(),
          ],
        )
        )
    );
  }
}
