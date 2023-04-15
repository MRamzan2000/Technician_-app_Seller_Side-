import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_seller_side/Documents/Upload.dart';

class Selection extends StatelessWidget {
  const Selection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 20),
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
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1.0, 2.0))
                        ]),
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
          SvgPicture.asset(
            "assets/Selection pic.svg",
            height: MediaQuery.of(context).size.height / 4.5,
          ),
          SizedBox(height: 60),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(1.0, 2.0),
              )
            ]),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting\nindustry. Lorem Ipsum has been the industry's standard dummy te\nxt ever since the 1500s, when an 20SR unknown printer took a \ngalley of type and scrambled it to make a type specimen book. ",
                style: TextStyle(fontSize: 12, color: Color(0xff653780)),
              ),
            ),
          ),
          SizedBox(height: 80),
          SizedBox(
            width: 130,
            height: 30,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Upload();
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
      ),
    );
  }
}
