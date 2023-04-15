import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Completed_Orders extends StatelessWidget {
  const Completed_Orders({Key? key}) : super(key: key);

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
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 30,
                            width: 30,
                            child: SvgPicture.asset(
                              "assets/Drawer.svg",
                              fit: BoxFit.scaleDown,
                            )),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Your Location",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                SvgPicture.asset("assets/drop down arrow.svg")
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset("assets/pngwing.com (13).png"),
                                // SizedBox(width: 5),
                                Text(
                                  "Al Balad",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 30,
                            width: 30,
                            child: SvgPicture.asset(
                              "assets/notification.svg",
                              fit: BoxFit.scaleDown,
                            )),
                      ],
                    ),
                    SizedBox(height: 30),
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
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Column(
                        children: [
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff653780),
                                              width: 1.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/pic.jpg")),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 40,
                                      width: 40,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ali Asghar",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xff653780)),
                                        ),
                                        Text(
                                          "aliasghar@gmail.com",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xffBAC0C0)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF89F5B),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          bottomLeft: Radius.circular(32))),
                                  height: 23,
                                  width:
                                      MediaQuery.of(context).size.width / 4.5,
                                  child: Center(
                                      child: Text(
                                    "Plumber",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 23),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(32),
                                    bottomRight: Radius.circular(32)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3,
                                      offset: Offset(1.0, 2.0))
                                ]),
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Earning",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xffF89F5B)),
                                      ),
                                      Text(
                                        "2564 SR",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Joining Date",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xffF89F5B)),
                                      ),
                                      Text(
                                        "September 25,2023",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 3, offset: Offset(1.0, 2.0))
            ]),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Active Orders",
                      style: TextStyle(fontSize: 14, color: Color(0xffB4B5B5)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Pending",
                      style: TextStyle(fontSize: 14, color: Color(0xffB4B5B5)),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff653780),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                bottomLeft: Radius.circular(32)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(1.0, 2.0))
                            ]),
                        height: 23,
                        width: MediaQuery.of(context).size.width / 12,
                        child: Center(
                            child: Text(
                          "02",
                          style: TextStyle(fontSize: 8.5, color: Colors.white),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF89F5B),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(1.0, 2.0))
                            ]),
                        height: 23,
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Center(
                          child: Text(
                            "Completed",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF89F5B),
                      border: Border.all(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(1.0, 2.0))
                      ]),
                  height: 90,
                  width: MediaQuery.of(context).size.width / 4,
                  child: SvgPicture.asset(
                    "assets/minisplit-svgrepo-com.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(1.0, 2.0))
                      ]),
                  height: 90,
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muhammad Taha",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Split Unit =",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "150 SR",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xffF89F5B)),
                                ),
                              ],
                            ),
                            Text(
                              " C-Block Johar Town near UMT",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xffBAC0C0)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "March 26,2023",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xffBAC0C0)),
                            ),
                            Text(
                              "254 SR",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF89F5B),
                      border: Border.all(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(1.0, 2.0))
                      ]),
                  height: 90,
                  width: MediaQuery.of(context).size.width / 4,
                  child: SvgPicture.asset(
                    "assets/Fan.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(1.0, 2.0))
                      ]),
                  height: 90,
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muhammad Taha",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Split Unit =",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "150 SR",
                                  style: TextStyle(
                                      fontSize: 13, color: Color(0xffF89F5B)),
                                ),
                              ],
                            ),
                            Text(
                              " C-Block Johar Town near UMT",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xffBAC0C0)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "March 26,2023",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xffBAC0C0)),
                            ),
                            Text(
                              "254 SR",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
