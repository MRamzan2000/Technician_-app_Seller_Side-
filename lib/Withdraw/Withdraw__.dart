import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_seller_side/Bank/Bank_Transfer.dart';

class Withdraw__ extends StatelessWidget {
  const Withdraw__({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xff653780),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))),
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF89F5B),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                  ),
                  height: 30,
                  width: MediaQuery.of(context).size.width / 2.6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          "Withdraw",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Bank_Transfer();
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/bank.svg"),
                    SizedBox(width: 15),
                    Text(
                      "Bank Transfer",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
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
            height: 50,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  SvgPicture.asset("assets/phone.svg"),
                  SizedBox(width: 15),
                  Text(
                    "By STC pay",
                    style: TextStyle(fontSize: 14, color: Colors.black),
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
