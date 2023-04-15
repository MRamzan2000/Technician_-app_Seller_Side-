import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_seller_side/Withdraw/Withdraw__.dart';

class Uploaded extends StatelessWidget {
  const Uploaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff653780),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35))),
                height: MediaQuery.of(context).size.height / 3.3,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 50),
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
                            ),
                            height: 30,
                            width: 30,
                            child: SvgPicture.asset(
                              "assets/Back Arrow.svg",
                              fit: BoxFit.scaleDown,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
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
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        SvgPicture.asset("assets/Uploaded side.svg"),
                        SizedBox(height: 10),
                        Text(
                          "   Documents has been uploaded!!\nPlease wait for the representative to\n                    approve",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(height: 40),
                        SizedBox(
                          width: 130,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff9C3587),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32))),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
