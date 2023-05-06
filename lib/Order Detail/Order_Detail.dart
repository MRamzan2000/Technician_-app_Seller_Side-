import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../All_APis/RequestAmount.dart';

class Order_Detail extends StatefulWidget {
  final String type;
  final String id;
  final String ammount;
  final String updatedammount;
  Order_Detail({Key? key,required this.type, required this.id, required this.ammount, required this.updatedammount}) : super(key: key);

  @override
  State<Order_Detail> createState() => _Order_DetailState();
}

class _Order_DetailState extends State<Order_Detail> {

  TextEditingController ammount = TextEditingController();
  void initState(){
    super.initState();
    // print(widget.orderid);
    setState(() {

      ammount.text = widget.updatedammount;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xfff8cdaa),
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
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
                            height: 25,
                            width: 25,
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back

                              ),
                            )),
                      ),
                      const Text(
                        "Order Detail",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff8cdaa),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0))
                    ]),
                height: 130,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: SvgPicture.asset(
                    "assets/minisplit-svgrepo-com.svg",
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              height: 200,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      widget.type,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetu elit, sed do eiusmod tempor Lore\nm ipsum dolor sit amet, consectetu elit, sed do eiusmod tempor Lorem ip\nsum dolor sit ame, consectetu elit, sed do",
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cleaning Price",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          widget.ammount,
                          style:
                          const TextStyle(fontSize: 18, color: Color(0xffFBBB8A)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: const Color(0xffB4B5B5),
                      height: 0.5,
                      width: MediaQuery.of(context).size.width / 1.2,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Set Price",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(1.0, 2.0))
                              ]),
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Row(
                              children:[
                                Expanded(child: Center(
                                  child: TextFormField(
                                    controller: ammount,
                                    keyboardType: TextInputType.number,

                                    decoration: const InputDecoration(

                                      contentPadding: EdgeInsets.only(left: 20),
                                        border: InputBorder.none
                                    ),
                                  ),
                                )
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "SR",
                                      style:
                                      TextStyle(fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ]
                          ),

                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 130,
              height: 30,
              child: ElevatedButton(
                  onPressed: () async{

                    ApiServiceForAmount.updateamount(widget.id, ammount.text).then((value) =>
                    {
                      if(value.message == "Order amount updated successfully"){
                        Navigator.of(context).pop()
                      }

                    });

                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff9C3587),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                  child: const Text(
                    "Request",
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
