import 'package:firebase/firebase.dart';
import 'package:firebase/src/interop/database_interop.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care_azhar/views/centered_view/sized_centered_view.dart';
import 'package:health_care_azhar/views/database_manager/admins_manager.dart';
import 'package:health_care_azhar/views/database_manager/chat_manager.dart';
import 'package:health_care_azhar/views/database_manager/database_manager.dart';
import 'package:health_care_azhar/views/database_manager/doctor_patiant_manager.dart';
import 'package:health_care_azhar/views/database_manager/doctors_manager.dart';
import 'package:health_care_azhar/views/database_manager/patiants_manager.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:health_care_azhar/views/manager/validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../router_manager.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();

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
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login", textAlign: TextAlign.center,),
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
                    // validation
                    if (!Validators.isFilled([_email.text,_password.text]))
                      {
                        Manager.showErrorMessage("Please fill in all fields");
                        return;
                      }
                    if (!Validators.isValidEmail(_email.text))
                      {
                        Manager.showErrorMessage("Please enter valid email");
                        return;
                      }


                    // check if user is admin
                    var user = await AdminsManager.getAdminByEmail(_email.text);
                    if (user != null)
                      {
                        // this is an admin
                        if (user['password'].toString() == _password.text)
                          {
                            // password is ok save data
                            Manager.isLogedIn = true;
                            Manager.currentUserEmail = _email.text;
                            Manager.currentUserId = int.parse(user['id']);
                            Manager.currentUserType = Manager.USERTYPE_ADMIN;
                            Manager.currentUserData = user;
                            Manager.saveCurrentData();
                            RouterManager.router.navigateTo(context, RouterManager.home_route);
                          }
                        else
                          {
                            Manager.showErrorMessage("Incorrect login data");
                          }
                      }
                    else
                      {
                        user = await DoctorsManager.getDoctorByEmail(_email.text);
                        if (user != null)
                        {
                          if (user['approved'].toString() == "false")
                            {
                              Manager.showErrorMessage("You have not been approved yet");
                              return;
                            }
                          // this is an admin
                          if (user['password'].toString() == _password.text)
                          {
                            // password is ok save data
                            Manager.isLogedIn = true;
                            Manager.currentUserEmail = _email.text;
                            Manager.currentUserId = int.parse(user['id']);
                            Manager.currentUserType = Manager.USERTYPE_DOCTOR;
                            Manager.currentUserData = user;
                            Manager.saveCurrentData();
                            RouterManager.router.navigateTo(context, RouterManager.home_route);
                          }
                          else
                          {
                            Manager.showErrorMessage("Incorrect login data");
                          }
                        }
                        else
                        {
                          user = await PatiantsManager.getPatiantByEmail(_email.text);
                          if (user != null)
                          {
                            // this is an patiant
                            if (user['password'].toString() == _password.text)
                            {
                              // password is ok save data
                              Manager.isLogedIn = true;
                              Manager.currentUserEmail = _email.text;
                              Manager.currentUserId = int.parse(user['id']);
                              Manager.currentUserType = Manager.USERTYPE_PATIANT;
                              Manager.currentUserData = user;
                              Manager.saveCurrentData();
                              RouterManager.router.navigateTo(context, RouterManager.home_route);
                            }

                            else
                            {
                              Manager.showErrorMessage("Incorrect login data");
                            }
                          }
                          else
                          {
                              Manager.showErrorMessage("Incorrect login data");
                          }
                        }
                      }

                  }, child: Text("Login")),
                  SizedBox(height: 30,),

                  OutlinedButton(onPressed: () {RouterManager.router.navigateTo(context, RouterManager.register_patianet_route);}, child: Text("Register"))
                ],
              ),
            )
        );

      }
    );
  }
}
