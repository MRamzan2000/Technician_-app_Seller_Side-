import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technician_seller_side/Withdraw/Withdraw__.dart';

import '../All_APis/ApiServiceForGetWalletAmount.dart';
import '../All_APis/ApiServiceForTransactions.dart';
import '../Models/Transactions.dart';

class wallet extends StatefulWidget {
  const wallet({Key? key}) : super(key: key);

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  initState() {
    super.initState();
    initialize();
  }
  String balance="0";
  void initialize() async {
    balance=await ApiServiceForGetWalletAmount.getAmount();
    print(balance);
    setState(() {});
  }

  Stream<TransactionList> getTransactionStream() async* {
    try {
      final TransactionList orders = await ApiServiceForTransactions.transactions();
      yield orders;
    } catch (e) {
      print(e);
    }
  }

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
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              Stack(
                children: [
                  Transform.translate(
                      offset: Offset(190, -60),
                      child: SvgPicture.asset("assets/design.svg")),
                  Column(
                    children: [
                      Padding(
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
                            width: MediaQuery.of(context).size.width / 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        height: 20,
                                        width: 20,
                                        child: SvgPicture.asset(
                                          "assets/Back Arrow.svg",
                                          fit: BoxFit.scaleDown,
                                        )),
                                  ),
                                  Text(
                                    "Wallet",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(1.0, 2.0))
                            ]),
                        height: 130,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Current Balance",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "${balance} SR",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ],
                              ),
                              SvgPicture.asset("assets/wallet pic.svg")
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 140,
            height: 30,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Withdraw__();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff9C3587),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
                child: Text(
                  "Withdraw",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Recent Transaction",
                style: TextStyle(fontSize: 15, color: Color(0xff3D3D3D)),
              ),
            ),
          ),
          SizedBox(height: 20),
          StreamBuilder(
            stream: getTransactionStream(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                final TransactionList transactions_ = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: transactions_.transactions!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.grey, blurRadius: 3, offset: Offset(1.0, 2.0))
                        ]),
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 3,
                                        offset: Offset(1.0, -2.0),
                                      )
                                    ]),
                                height: 70,
                                width: 70,
                                child: SvgPicture.asset(
                                  "assets/Wallet split.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${transactions_.transactions![index].id}",
                                      style: TextStyle(fontSize: 10, color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Split Unit ",
                                          style:
                                          TextStyle(fontSize: 12, color: Colors.black),
                                        ),
                                        SizedBox(width: 150),
                                        Text(
                                          "${transactions_.transactions![index].amount} SR",
                                          style: TextStyle(
                                              fontSize: 15, color: Color(0xffF89F5B)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${transactions_.transactions![index].createdAt}",
                                      style:
                                      TextStyle(fontSize: 10, color: Color(0xffBAC0C0)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while waiting for data
                return CircularProgressIndicator();
              } else {
                // If snapshot.data is null, show an error message
                return Text('Error: No data available');
              }
            },
          ),
        ],
      ),
    );
  }
}
