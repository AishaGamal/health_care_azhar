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
import 'package:health_care_azhar/views/database_manager/messages_manager.dart';
import 'package:health_care_azhar/views/database_manager/patiants_manager.dart';
import 'package:health_care_azhar/views/manager/manager.dart';
import 'package:health_care_azhar/views/manager/validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../router_manager.dart';

class MessageForm extends StatelessWidget {
  const MessageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _fullname = TextEditingController();
    TextEditingController _message = TextEditingController();
    TextEditingController _subject = TextEditingController();
    TextEditingController _phone = TextEditingController();

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
                    Text("Send us a message", textAlign: TextAlign.center,),
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
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: _phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _subject,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Subject',
                      ),
                    ),
                    SizedBox(height: 30,),

                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: _message,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Message',
                      ),
                    ),
                    SizedBox(height: 30,),

                    ElevatedButton(onPressed: () async {
                      if (!Validators.isFilled([_email.text,_phone.text,_message.text,_subject.text,_fullname.text]))
                      {
                        Manager.showErrorMessage("Please fill in all fields");
                        return;
                      }
                      if (!Validators.isValidEmail(_email.text))
                      {
                        Manager.showErrorMessage("Please enter valid email");
                        return;
                      }
                      if (!Validators.isValidNumber(_phone.text))
                      {
                        Manager.showErrorMessage("Please enter valid phone number");
                        return;
                      }


                      MessagesManager.addMessage(_fullname.text, 
                          _email.text, _subject.text, _message.text, _phone.text);
                      Manager.showSuccessMessage("Your message has been sent");
                      _fullname.clear();
                      _email.clear();
                      _subject.clear();
                      _message.clear();
                      _phone.clear();

                    }, child: Text("Send Message")),
                    SizedBox(height: 30,),

                  ],
                ),
              )
          );

        }
    );
  }
}
