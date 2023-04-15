import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff653780),
      body: Column(
        children: [
          SizedBox(height: 60),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
              ),
              height: 30,
              width: MediaQuery.of(context).size.width / 2.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
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
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            "assets/Back Arrow.svg",
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                    Text(
                      "Notification",
                      style: TextStyle(fontSize: 16, color: Color(0xff653780)),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(22)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Today",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff3D3D3D)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0))
                    ]),
                    height: 105,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "9:41",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff3D3D3D)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0))
                                    ]),
                                height: 70,
                                width: 65,
                                child: SvgPicture.asset(
                                  "assets/Notificationsssssssssssss.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notification 1",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff3D3D3D)),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Recent",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff3D3D3D)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0))
                    ]),
                    height: 105,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "2:41",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff3D3D3D)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0))
                                    ]),
                                height: 70,
                                width: 65,
                                child: SvgPicture.asset(
                                  "assets/Notificationsssssssssssss.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notification 2",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff3D3D3D)),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0))
                    ]),
                    height: 105,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "11:00",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff3D3D3D)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0))
                                    ]),
                                height: 70,
                                width: 65,
                                child: SvgPicture.asset(
                                  "assets/Notificationsssssssssssss.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notification 3",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff3D3D3D)),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0))
                    ]),
                    height: 105,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "9:00",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff3D3D3D)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0))
                                    ]),
                                height: 70,
                                width: 65,
                                child: SvgPicture.asset(
                                  "assets/Notificationsssssssssssss.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notification 4",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff3D3D3D)),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
