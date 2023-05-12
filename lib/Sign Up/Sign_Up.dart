import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/All_APis/ApiServiceForSignup.dart';
import 'package:intl/intl.dart';
import 'package:twilio_flutter/twilio_flutter.dart';


import '../Map/map.dart';
import '../Sign_In/Sign_in.dart';
import 'Verify.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  double latitude = 0.0;
  double longitude = 0.0;
  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  late TwilioFlutter twilioFlutter;
  @override
  void initState() {


    inititialize();
    firstname = TextEditingController();
    lastname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController(text: '+92');
    id = TextEditingController();
    twilioFlutter = TwilioFlutter(
        accountSid: "ACc6f159fb5f0f63c7988b171d25d16c6f",
        authToken: "aea7a8019e5003a1f21e22d8491b5c21",
        twilioNumber: "+15856321097"
    );
    super.initState();

    inititialize();
  }
  String myid = "";
  int n=-1;

  String _address="No Address";


  Future<void> _checkLocationPermission() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Getting Your Location Please Wait!'),
      ),
    );
    setState(() {
      _loading = true;
    });

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    bool locationObtained = false;
    while (!locationObtained) {
      try {
        _locationData = await location.getLocation();
        longitude = _locationData.longitude!;
        latitude = _locationData.latitude!;
        final coordinates = Coordinates(latitude, longitude);
        var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        var first = addresses.first;
        final prefs = await SharedPreferences.getInstance();
        setState(() {
          print("lat : "  + latitude.toString());
          print("lot: " + longitude.toString());
          _address = "${first.addressLine}";
          prefs.setString('address', first.addressLine);
          print(_address);
        });
        upload();

        locationObtained = true;
      } catch (e) {
        // Location not obtained, retrying...
        print(e);
        await Future.delayed(Duration(seconds: 1));
      }
    }


  }

  upload(){
    setState(() {

      _loading  =true;
    });
    Map<String, dynamic> body = {

      "firstname": firstname.text,
      "lastname": lastname.text,
      "email": email.text,
      "password": password.text,
      "phonenumber": phone.text,
      "city": city,
      "dateofbirth": dob.toString(),
      "idofiqama": id.text


    };
    ApiServiceForSignup.signup(body).then((value) => {

      if(value.message  == "Seller created successfully"){

        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return MapSample(lat: latitude, long: longitude,);
            })),

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar( content: Text('Seller Created Successfuly!'), )),
        setState(() {

          _loading  =false;
        })


      }

      else{
        setState(() {

          _loading  =false;
        }),
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: value.error == null ? Text(value.message.toString()) : Text(value.error.toString()),
            content: Text(value.message.toString()),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ],
          ),
        )
      }
    });
  }

  inititialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid = prefs.getString("id") ?? "";
    });
  }

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill all required fields';
    }
    return null;
  }
  final _formKey = GlobalKey<FormState>();

  late TextEditingController firstname ;
  late TextEditingController lastname ;
  late TextEditingController email;
  late TextEditingController password ;
  late TextEditingController id ;
  late TextEditingController fristname ;
  late TextEditingController phone;
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
          child: Form(
            key: _formKey,
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
                    validator: validateRequired,

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
                    validator: validateRequired,

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
                    validator: validateRequired,

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
                    validator: validateRequired,

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
                    validator: validateRequired,

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
                    validator: validateRequired,

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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          if(_address=="No Address"){

                             _checkLocationPermission();


                            n=0;
                          }

                        }


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
