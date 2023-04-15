import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technician_seller_side/Messages/Messages.dart';
import 'package:technician_seller_side/Type%20of%20work/Type_of_work.dart';

class Service_App extends StatelessWidget {
  const Service_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/Service app.svg",
            fit: BoxFit.cover,
          ),
          SvgPicture.asset(
            "assets/Service app shadow.svg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Type_of_work();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
                height: 40,
                width: MediaQuery.of(context).size.width / 3.2,
                child: Center(
                    child: Text(
                  "Service App",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
              ),
            ),
          ),
          Center(child: Image.asset("assets/Group 11971.png")),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(50)),
                height: 180,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Select Your Location",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1.0, 2.0))
                          ]),
                      height: 30,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 20),
                            prefixIcon: SvgPicture.asset(
                              "assets/Service Search.svg",
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: "Type your address here",
                            hintStyle: TextStyle(
                                fontSize: 9, color: Color(0xffACACAC))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/serviceLocation.svg"),
                          SizedBox(width: 5),
                          Text(
                            "21, Alex Davidson Avenue, Opposite Omegatron, Vicent",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 170,
                      height: 33,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9C3587),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            "Select current address",
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
