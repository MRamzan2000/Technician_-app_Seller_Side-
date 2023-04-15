import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_seller_side/Documents/Uploaded.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
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
              SizedBox(height: 20),
              Text(
                "Upload Your Documents",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1.0, 2.0))
                    ]),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    SvgPicture.asset("assets/passport-ticket-icon.svg"),
                    SizedBox(height: 15),
                    Text(
                      "Upload picture of your Passport",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 100,
                      height: 25,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9C3587),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            "Upload",
                            style: TextStyle(fontSize: 7, color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1.0, 2.0))
                    ]),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    SvgPicture.asset("assets/Training Documents.svg"),
                    SizedBox(height: 15),
                    Text(
                      "Upload your Training Documents",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 100,
                      height: 25,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9C3587),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            "Upload",
                            style: TextStyle(fontSize: 7, color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1.0, 2.0))
                    ]),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    SvgPicture.asset("assets/health check.svg"),
                    SizedBox(height: 15),
                    Text(
                      "Medical Health Check",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 100,
                      height: 25,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9C3587),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            "Upload",
                            style: TextStyle(fontSize: 7, color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 130,
                height: 30,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Uploaded();
                      }));
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
          )
        ]),
      ],
    ));
  }
}
