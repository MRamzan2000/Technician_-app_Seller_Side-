import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:technician_seller_side/All_APis/ApiServiceForSignup.dart';
import 'package:technician_seller_side/Service%20App/Service_App.dart';
import 'package:intl/intl.dart';
import 'package:twilio_flutter/twilio_flutter.dart';


import '../Sign_In/Sign_in.dart';
import 'Code Verify.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {

  late TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: "ACc6f159fb5f0f63c7988b171d25d16c6f",
        authToken: "83f346f874c829475a8ea304993c3b65",
        twilioNumber: "+15856321097"
    );
    super.initState();
  }
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController fristname = TextEditingController();
  TextEditingController phone = TextEditingController(text: '+92');
  var numbber = 0;
  String city="Lahore";
  void sendSms() async {
    var random = Random();
    numbber =  random.nextInt(9000) + 1000;
    twilioFlutter.sendSMS(
        toNumber: phone.text.toString(),
        messageBody: 'Your Confirmation Code is ${numbber} \n Thankyou.').then((value) {
      print(value);
    });
  }
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: _loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              SvgPicture.asset("assets/Sign up.svg",
                  height: MediaQuery.of(context).size.height / 3),
              SizedBox(height: 30),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: firstname,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20),
                      hintText: "First name",
                      hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: lastname,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20),
                      hintText: "Last name",
                      hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20),
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  controller: id,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20),
                      hintText: "ID-Iqyama",
                      hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  controller: phone,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20),
                      hintText: "Phone number",
                      hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20,),
                      SizedBox(
                        height: 40,
                        width: 80,
                        child: DropdownButtonFormField(
                          icon:
                          SvgPicture.asset("assets/Drop down.svg"),
                          value: "Lahore",
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Lahore",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              value: "Lahore",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Islamabad",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              value: "Islamabad",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Jhelum",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              value: "Jhelum",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Faislabad",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              value: "Faislabad",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "karachi",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              value: "karachi",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Sindh",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              value: "Sindh",
                            )
                          ],
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),),
                  Expanded(child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffFFFFFF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32))),
                      child: Text(
                        "${dob}",
                        style: TextStyle(
                            fontSize: 11, color: Color(0xff9C3587)),
                      ))  ),
                  SizedBox(width: 20,),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 130,
                height: 30,
                child: ElevatedButton(
                    onPressed: () {

                      sendSms();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return CodeVerify(code: numbber.toString(), firstname: firstname.text, lastname:  lastname.text, email: email.text, pass: password.text, phone: phone.text, city:city.toString(), dob: dob.toString(), id: id.text.toString(),);
                          }));

                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return Service_App();
                      // }));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff9C3587),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    )),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {


                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Sign_in();
                      }));
                    },
                    child: Text(
                      " Sign In",
                      style: TextStyle(fontSize: 12, color: Color(0xff585D5E)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  DateTime _selectedDate=DateTime.now();
  String dob='Date of Birth';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dob = DateFormat('yyyy-MM-dd').format(_selectedDate);
        setState(() {

        });
      });
    }
  }
}
