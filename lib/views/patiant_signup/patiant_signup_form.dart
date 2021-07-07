import 'package:firebase/firebase.dart';
import 'package:firebase/src/interop/database_interop.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/sized_centered_view.dart';
import 'package:health_care_azhar/views/database_manager/admins_manager.dart';
import 'package:health_care_azhar/views/database_manager/chat_manager.dart';
import 'package:health_care_azhar/views/database_manager/database_manager.dart';
import 'package:health_care_azhar/views/database_manager/doctor_patiant_manager.dart';
import 'package:health_care_azhar/views/database_manager/patiants_manager.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:health_care_azhar/views/manager/validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../router_manager.dart';

class PatiantSignupForm extends StatelessWidget {

  TextEditingController _email = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _device_id = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return ResponsiveBuilder(
        builder: (context,sizingInformation) {
          double formPadding = sizingInformation.isDesktop?200:0;
          return SizedCenteredView(
              formPadding,
              20,
              Container(

                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  border: Border.all(
                    color: const Color(0xff7c94b6),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Patiant Signup", textAlign: TextAlign.center,),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.name,
                      controller: _fullname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _age,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _device_id,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Device ID',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 30,),

                    ElevatedButton(onPressed: () async {
                      if (!Validators.isFilled([_email.text,_password.text,_device_id.text,_fullname.text,_age.text]))
                      {
                        Manager.showErrorMessage("Please fill in all fields");
                        return;
                      }
                      if (!Validators.isValidEmail(_email.text))
                      {
                        Manager.showErrorMessage("Please enter valid email");
                        return;
                      }
                      if (!Validators.isValidNumber(_age.text))
                      {
                        Manager.showErrorMessage("Please enter valid age");
                        return;
                      }
                      if (int.parse(_age.text) < 0 || int.parse(_age.text) > 120)
                        {
                          Manager.showErrorMessage("Please enter valid age");
                          return;
                        }

                      var user = await PatiantsManager.getPatiantByEmail(_email.text);
                      if (user != null)
                      {
                        Manager.showErrorMessage("This email already registered, Please login");
                        return;
                      }

                      PatiantsManager.addPatiant(_fullname.text, _email.text, _password.text, _device_id.text, _age.text);
                      Manager.showSuccessMessage("You have been registered");
                      RouterManager.router.navigateTo(context, RouterManager.login_route);
                    }, child: Text("Signup")),
                    SizedBox(height: 30,),

                  ],
                ),
              )
          );

        }
    );
  }
}
