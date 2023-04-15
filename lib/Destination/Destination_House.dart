import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Destination_House extends StatelessWidget {
  const Destination_House({Key? key}) : super(key: key);

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
              width: MediaQuery.of(context).size.width / 2,
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
                      "Destination House",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            "assets/Image 28.png",
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1.05,
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
                  "Back",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
