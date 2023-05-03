import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technician_seller_side/Sign_In/Sign_in.dart';

import 'Second_Page.dart';

class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Sign_in();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffE53F71),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(32))),
                height: 30,
                width: MediaQuery.of(context).size.width / 4,
                child: Center(
                    child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              "assets/First Page.svg",
            ),
          ),
          SvgPicture.asset("assets/Slider 1.svg"),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff653780),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular(70)),
                        border: Border.all(color: Colors.grey, width: 1.0)),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Text(
                          "Lorem ipsum dolor\n sit amet consectur",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetu\n         elit, sed do eiusmod tempor",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffE53F71),
                              borderRadius: BorderRadius.circular(100)),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return Second_Page();
                                }));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Transform.translate(
                      offset: Offset(-70, 160),
                      child:
                          SvgPicture.asset("assets/Starting Page design.svg"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
