import 'package:firebase/firebase.dart';
import 'package:firebase/src/interop/database_interop.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:health_care_azhar/views/centered_view/sized_centered_view.dart';
import 'package:health_care_azhar/views/database_manager/admins_manager.dart';
import 'package:health_care_azhar/views/database_manager/chat_manager.dart';
import 'package:health_care_azhar/views/database_manager/database_manager.dart';
import 'package:health_care_azhar/views/database_manager/doctor_patiant_manager.dart';
import 'package:health_care_azhar/views/database_manager/doctors_manager.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:health_care_azhar/views/manager/validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../router_manager.dart';

class DoctorSignupForm extends StatelessWidget {
   DoctorSignupForm({Key? key}) : super(key: key);

   TextEditingController _email = TextEditingController();
   TextEditingController _address = TextEditingController();
   TextEditingController _location = TextEditingController();
   TextEditingController _fullname = TextEditingController();
   TextEditingController _nid = TextEditingController();
   TextEditingController _password = TextEditingController();
   TextEditingController _speciality = TextEditingController();
   TextEditingController _working_hours = TextEditingController();

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
                    Text("Send Doctor Join Request", textAlign: TextAlign.center,),
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
                      controller: _nid,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'National ID',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _speciality,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Speciality',
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

                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _address,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _working_hours,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Working Hours',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _location,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location On Maps',
                      ),
                    ),
                    SizedBox(height: 30,),


                    ElevatedButton(onPressed: () async {
                      if (!Validators.isFilled([_email.text,_password.text,_location.text,
                        _fullname.text,_working_hours.text,_address.text,_speciality.text,_nid.text]))
                      {
                        Manager.showErrorMessage("Please fill in all fields");
                        return;
                      }
                      if (!Validators.isValidEmail(_email.text))
                      {
                        Manager.showErrorMessage("Please enter valid email");
                        return;
                      }
                      if (!Validators.isValidNumber(_nid.text))
                      {
                        Manager.showErrorMessage("Please enter valid National ID");
                        return;
                      }
                      if (_nid.text.toString().length != 14)
                      {
                        Manager.showErrorMessage("Please enter valid National ID");
                        return;
                      }

                      var user = await DoctorsManager.getDoctorByEmail(_email.text);
                      if (user != null)
                      {
                        Manager.showErrorMessage("This email already registered, Please login");
                        return;
                      }

                      int count = await DoctorsManager.table.getCount();
                      count++;
                      DoctorsManager.table.setCount(count);

                      count = await DoctorsManager.getRequestsCount();
                      count++;
                      DoctorsManager.setRequestsCount(count);

                      DoctorsManager.addDoctor(_fullname.text, _email.text, _password.text, _address.text,_nid.text
                          , _speciality.text, _working_hours.text, _location.text);
                      Manager.showSuccessMessage("Your request has been sent");
                      RouterManager.router.navigateTo(context, RouterManager.login_route);

                    }, child: Text("Send Request")),
                    SizedBox(height: 30,),

                  ],
                ),
              )
          );

        }
    );
  }
}
