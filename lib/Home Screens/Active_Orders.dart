import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoder/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_seller_side/All_APis/ApiServiceForSignup.dart';
import 'package:technician_seller_side/Sign_In/Sign_in.dart';
import 'package:technician_seller_side/Type%20of%20work/Type_of_work.dart';
import '../All_APis/ApiServiceForAcceptOrders.dart';
import '../All_APis/ApiServiceForCancelOrder.dart';
import '../All_APis/ApiServiceForSellerOrders.dart';
import '../All_APis/RequestAmount.dart';
import '../Map/map.dart';
import '../Models/Orders.dart';
import '../Order Detail/Order_Detail.dart';
import '../temp.dart';
class Active_Orders extends StatefulWidget {
  const Active_Orders({Key? key}) : super(key: key);

  @override
  State<Active_Orders> createState() => _Active_OrdersState();
}

class _Active_OrdersState extends State<Active_Orders> {

  Timer? _timer;
  String earnings = " 0";

  @override
  void initState() {
    super.initState();
    initialize();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      getActiveOrders();
    });
    print(earnings);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel(); // cancel the timer
    _streamController.close();
  }


  StreamController<OrderList> _streamController = StreamController();


  Future<void> getActiveOrders() async{
    OrderList dataModel = await ApiServiceForSellerOrders.sellerOrders() as OrderList;
     await ApiServiceForAmount.getEarnings(id!).then((value) => {
       if(value.message != "") {

         earnings = value.message!,
       }

     });
    setState(() {
      orders_length=dataModel.orders.length;

    });
    _streamController.sink.add(dataModel);
  }

  String? firstname;
  String? lastname;
  String? city;
  String? createdAt;
  String? email;
  String? type;
  String? id;
  String? address;

  void initialize() async {
    final prefs = await SharedPreferences.getInstance();
    firstname = prefs.getString('firstname').toString();
    if(prefs.getString('address')==null){
      address = prefs.getString('address').toString();

    }
    lastname = prefs.getString('lastname').toString();
    city = prefs.getString('city').toString();
    createdAt = prefs.getString('createdAt').toString();
    createdAt = createdAt!.substring(0, 10);
    email = prefs.getString('email').toString();
    type = prefs.getString('type').toString();
    id = prefs.getString('id').toString();
    setState(() {});
  }
  int orders_length=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(100))),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xff653780),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    )
                  ]),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 70, bottom: 10),
                    child: SvgPicture.asset("assets/6396 [Converted].svg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: SvgPicture.asset("assets/6350.svg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: SizedBox(
                            height: 60,
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(32),
                                          bottomRight: Radius.circular(32)),
                                    ),
                                    height: 30,
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Center(
                                        child: Text(
                                          "$firstname $lastname",
                                          // textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage("assets/pic.jpg")),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      border: Border.all(
                                          color: Colors.white, width: 0.5)),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              height: 35,
                              width: 35,
                              child: SvgPicture.asset(
                                "assets/close drawr.svg",
                                fit: BoxFit.scaleDown,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  SvgPicture.asset("assets/pay-money-icon.svg"),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Transaction",
                      style: TextStyle(fontSize: 14, color: Color(0xff233245)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  SvgPicture.asset("assets/change service.svg"),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Type_of_work();
                          }));
                    },
                    child: Text(
                      "Change Service",
                      style: TextStyle(fontSize: 14, color: Color(0xff233245)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  SvgPicture.asset("assets/log out.svg"),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                "assets/Profile.svg",
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            content: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 32,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xff9C3587),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32))),
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      )),
                                ),
                                SizedBox(width: 20),
                                SizedBox(
                                  width: 100,
                                  height: 32,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        ApiServiceForSignup.Logout()
                                            .then((value) => {
                                                  if (value.message ==
                                                      "Seller logged out successfully")
                                                    {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                        return Sign_in();
                                                      }))
                                                    }
                                                  else
                                                    {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            CupertinoAlertDialog(
                                                          title: const Text(
                                                              "Error"),
                                                          content: value
                                                                      .error ==
                                                                  null
                                                              ? Text(value
                                                                  .message
                                                                  .toString())
                                                              : Text(value.error
                                                                  .toString()),
                                                          actions: <Widget>[
                                                            CupertinoDialogAction(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  "Ok"),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    }
                                                });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xffFFFFFF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32))),
                                      child: Text(
                                        "Sign out",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xff9C3587)),
                                      )),
                                ),
                              ],
                            )),
                      );
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 14, color: Color(0xff233245)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff653780),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
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
                              child: Builder(builder: (context) {
                                return InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/Drawer.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                );
                              })),
                          // InkWell(
                          //   onTap: (){
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (BuildContext context) {
                          //       return const MapSample();
                          //     }));
                          //   },
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         children: [
                          //           Text(
                          //             "Your Location",
                          //             style: TextStyle(
                          //                 fontSize: 11, color: Colors.grey),
                          //           ),
                          //           SizedBox(width: 5),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          InkWell(
                            onTap: () {
                            },
                            child: Container(
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
                          ),
                        ],
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
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff653780),
                                                width: 1.0),
                                            image: const DecorationImage(
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
                                            "${firstname} ${lastname}",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff653780)),
                                          ),
                                          Text(
                                            "${email}",
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
                                        color: Color(0xfff89f5b),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(32),
                                            bottomLeft: Radius.circular(32))),
                                    height: 23,
                                    width:
                                        MediaQuery.of(context).size.width / 4.5,
                                    child: Center(
                                        child: Text(
                                      "${type}",
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
                                          earnings + " SR",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
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
                                          "${createdAt}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: Text(
                    "Active Orders",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xfff89f5b),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(1.0, 2.0))
                        ]),
                    height: 25,
                    width: 25,
                    child: Center(
                        child: Text(
                      "${orders_length}",
                      style: TextStyle(fontSize: 8.5, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<OrderList>(
              stream: _streamController.stream,
              builder: (context,snapdata){
                switch(snapdata.connectionState){
                  case ConnectionState.waiting: return Center(child: CircularProgressIndicator(),);
                  default: if(snapdata.hasError){
                    return Text('Please Wait....');
                  }else{
                    final OrderList orders = snapdata.data!;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: orders.orders.length,
                        itemBuilder: (BuildContext context, int index) {
                          String date = orders.orders[index].date.toString().split(':')[0];
                          String time = orders.orders[index].time.toString();
                          time = time.split('.')[0];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfffbceac),
                                      border:
                                      Border.all(color: Colors.white, width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(1.0, 2.0))
                                      ]),
                                  height: 125,
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: SvgPicture.asset(
                                    "assets/Fan.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                   if( orders.orders[index].status=="New"){

                                     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                                       return  Order_Detail(ammount: orders.orders[index].amount, type: orders.orders[index].type, id: orders.orders[index].id, updatedammount:orders.orders[index].updatedamount,);
                                     }));

                                   }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: orders.orders[index].updatedamount == null
                                            ? Colors.white
                                            : Colors.red.shade100,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0))
                                        ]),
                                    height: 130,
                                    width: MediaQuery.of(context).size.width / 1.6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  orders.orders[index].username.toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(builder: (BuildContext context) {
                                                      return ChatScreen(myUserId: id.toString(),otherUserId: orders.orders[index].customerId, name: orders.orders[index].username,);
                                                    }));
                                                  },
                                                  icon: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                        BorderRadius.circular(7),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.grey,
                                                              blurRadius: 3,
                                                              offset: Offset(1.0, 2.0))
                                                        ]),
                                                    height: 20,
                                                    width: 20,
                                                    child: Icon(
                                                      Icons.chat
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${orders.orders[index].type.toString()}',
                                                style: TextStyle(
                                                    fontSize: 10, color: Colors.black),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '${orders.orders[index].amount.toString()} SR',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xffF89F5B)),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${orders.orders[index].address}\n ${date}  .  ${time}",
                                            style: TextStyle(
                                                fontSize: 10, color: Colors.grey),
                                          ),
                                          SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  height: 20,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        print(orders.orders[index].status);
                                                        if(orders.orders[index].status=="New"){
                                                          ApiServiceForAcceptOrders.accept(orders.orders[index].id.toString()).then((value) => {
                                                            if(value==true){
                                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('ORDER ACCEPTED Successfully!'))),

                                                              print("ORDER ACCEPTED")
                                                            }
                                                            else{
                                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('ORDER  ACCEPTED Failed!'))),

                                                              print("Not accepted")
                                                            }
                                                          });
                                                        }
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Color(0xff9C3587),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  32))),
                                                      child: Text(
                                                        orders.orders[index].status=="New"?"Accept":"In Progress",
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            color: Colors.white),
                                                      )),
                                                ),
                                                orders.orders[index].status=="New"?SizedBox(
                                                  width: 80,
                                                  height: 20,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        if(orders.orders[index].status=="New"){
                                                          ApiServiceForCancelOrders.cancel(orders.orders[index].id.toString()).then((value) => {
                                                            if(value==true){
                                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('ORDER Cancelled!'))),

                                                              print("ORDER Cancelled")
                                                            }
                                                            else{
                                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('ORDER Cancellation Failed!'))),

                                                              print("Not Cancelled")
                                                            }
                                                          });
                                                        }

                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Color(0xffFFFFFF),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  32))),
                                                      child: Text(
                                                        "Decline",
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            color: Color(0xff9C3587)),
                                                      )),
                                                ):SizedBox(),


// Image.asset("assets/download-23.png",fit: BoxFit.scaleDown,height: 35,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            )

          ],
        ),
      ),
    );
  }



}
