import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/All_APis/ApiServiceForSellerUpdateType.dart';
import 'package:technician_seller_side/Bottom/Bottom_bar.dart';
import 'package:technician_seller_side/Documents/Upload.dart';
import 'package:technician_seller_side/Home%20Screens/Active_Orders.dart';
import 'package:technician_seller_side/Type%20of%20work/Selection.dart';

import '../All_APis/ApiServiceForSignup.dart';
import '../Sign_In/Sign_in.dart';

class Type_of_work extends StatefulWidget {
  const Type_of_work({Key? key}) : super(key: key);

  @override
  State<Type_of_work> createState() => _Type_of_workState();
}

class _Type_of_workState extends State<Type_of_work> {
  bool ElectricServices = false;
  bool PlumberServices = false;
  bool CoolingService = false;
  bool HeaterService = false;
  String myid = "";

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid = prefs.getString("id") ?? "";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(1.0, 2.0))
                            ]),
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          "assets/Back Arrow.svg",
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  "assets/Type Of work.svg",
                ),
              ),
              SizedBox(height: 20),
              Text(
                "What type of work do you do?",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  setState(() {
                    ElectricServices = !ElectricServices;
                    PlumberServices = false;
                    CoolingService = false;
                    HeaterService = false;
                  });

                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ElectricServices == true
                              ? Color(0xff9C3587)
                              : Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0),
                        )
                      ]),
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 12),
                    child: Text(
                      "Electric Services",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    ElectricServices = false;
                    PlumberServices = !PlumberServices;
                    CoolingService = false;
                    HeaterService = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: PlumberServices == true
                              ? Color(0xff9C3587)
                              : Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0),
                        )
                      ]),
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 12),
                    child: Text(
                      "Plumber Services",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    ElectricServices = false;
                    PlumberServices = false;
                    CoolingService = !CoolingService;
                    HeaterService = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: CoolingService == true
                              ? Color(0xff9C3587)
                              : Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0),
                        )
                      ]),
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 12),
                    child: Text(
                      "Cooling Service",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    ElectricServices = false;
                    PlumberServices = false;
                    CoolingService = false;
                    HeaterService = !HeaterService;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: HeaterService == true
                              ? Color(0xff9C3587)
                              : Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0),
                        )
                      ]),
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 12),
                    child: Text(
                      "Heater Service",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 130,
                height: 30,
                child: ElevatedButton(
                    onPressed: () {
                      String type=" ";
                      if(ElectricServices){
                        type="Electric";
                      }
                      if(PlumberServices){
                        type="Plumber";
                      }
                      if(CoolingService){
                        type="Cooling";
                      }
                      if(HeaterService){
                        type="Heater";
                      }
                      Map<String, dynamic> body = {
                        "type":type
                      };
                      ApiServiceForSellerUpdateType.updateType(body).then((value) =>{

                        if(value=="Seller type updated successfully"){
                          if(myid==""){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return const Sign_in();
                                }))
                          }else{
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return const Bottom_bar();
                                })),
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('Service Changed Successfully!')))
                          }
                        }
                        else{
                        showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text("Error"),
                          content: Text(value.toString()),
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

                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff9C3587),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
