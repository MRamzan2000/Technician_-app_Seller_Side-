import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:technician_seller_side/All_APis/ApiServiceForSignup.dart';
import 'package:technician_seller_side/Home%20Screens/Active_Orders.dart';
import 'package:technician_seller_side/Sign%20Up/Sign_Up.dart';

import '../All_APis/ApiServiceForGettingUserInfo.dart';
import '../Bottom/Bottom_bar.dart';
import '../ForgotPass_verify_change_pass/ForgotPass.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: _loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                SvgPicture.asset(
                  "assets/Sign in.svg",
                  height: MediaQuery.of(context).size.height / 3,
                ),
                SizedBox(height: 30),
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "Email ID",
                        hintStyle: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        child : Text("Forgot Password",style: TextStyle(fontSize: 8, color: Colors.black), ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return ForgotPassword();
                          }));

                        },
                      )),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 130,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _loading = true;
                        });
                        Map<String, dynamic> body = {
                          "email": "immuhammadfaizan@gmail.com",
                          "password": "password",
                        };
                        ApiServiceForSignup.signin(body).then((value) async{
                          if (value.riderId != null) {
                            print(value.riderId);
                            await ApiServiceForGettingUserInfo.GetUserInfo();
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return Bottom_bar();
                                }));
                            setState(() {
                              _loading = false;
                            });
                            // setState(() {
                            //
                            //   _loading =false;
                            //
                            // });
                          } else {
                            setState(() {
                              _loading = false;
                            });
                            // setState(() {
                            //
                            //   _loading =false;
                            //
                            // });

                            showDialog(
                              context: context,
                              builder: (BuildContext context) => CupertinoAlertDialog(
                                title: const Text("Error"),
                                content: Text(value.message.toString()),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              ),
                            );
                            // Error
                            print("Error: ${value.riderId}");
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => CupertinoAlertDialog(
                                title: const Text("Error"),
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
                            );
                          }
                        });
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //   return Bottom_bar();
                        // }));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff9C3587),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32))),
                      child: Text(
                        "Sign In",
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
                          return Sign_Up();
                        }));
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(fontSize: 12, color: Color(0xff585D5E)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  "Sign In with",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/Sign in apple.svg"),
                    SizedBox(width: 10),
                    SvgPicture.asset("assets/Sign in mail.svg")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
