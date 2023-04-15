import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Person_1.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF89F5B),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              height: 30,
              width: MediaQuery.of(context).size.width / 2.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
                          ),
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            "assets/Back Arrow.svg",
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                    Text(
                      "Messages",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
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
            height: 40,
            width: MediaQuery.of(context).size.width / 1.1,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 5),
                prefixIcon: SvgPicture.asset(
                  "assets/Search box.svg",
                  fit: BoxFit.scaleDown,
                ),
                hintText: "Search Now",
                hintStyle: TextStyle(fontSize: 10, color: Color(0xff97AABD)),
              ),
            ),
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Person_1();
              }));
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 3, offset: Offset(1.0, 2.0))
              ]),
              height: 85,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 3),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "9:00",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff3D3D3D)),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/pic.jpg")),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff2F62BB),
                                  blurRadius: 2,
                                )
                              ]),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Person 1",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff3D3D3D)),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 3, offset: Offset(1.0, 2.0))
            ]),
            height: 85,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 3),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "9:00",
                      style: TextStyle(fontSize: 12, color: Color(0xff3D3D3D)),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/pic.jpg")),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff2F62BB),
                                blurRadius: 2,
                              )
                            ]),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Person 2",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff3D3D3D)),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
