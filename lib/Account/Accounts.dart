import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../All_APis/ApiServiceForSignup.dart';
import '../All_APis/ApiServiceForUpdateUserInfo.dart';

class Accounts extends StatefulWidget {
  Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}
List<String> list = <String>['Lahore','Quetta','Karachi','Multan','Islamabad'];
class _AccountsState extends State<Accounts> {
  @override
  initState() {
    super.initState();
    initialize();
  }

  String? firstname;
  String? lastname;
  String? city;
  String? dateofbirth;
  String? email;
  String? phonenumber;
  List<TextEditingController> controllers = [  TextEditingController(),  TextEditingController(),  TextEditingController(),TextEditingController()];
  String dropdownValue = list.first;
  void initialize()async {

    final prefs = await SharedPreferences.getInstance();
    firstname=prefs.getString('firstname').toString();
    lastname=prefs.getString('lastname').toString();
    city=prefs.getString('city').toString();
    dateofbirth=prefs.getString('dateofbirth').toString();
    email=prefs.getString('email').toString();
    phonenumber=prefs.getString('phonenumber').toString();
    setState(() {
      controllers[0].text=firstname.toString();
      controllers[1].text=lastname.toString();
      controllers[2].text=email.toString();
      controllers[3].text=phonenumber.toString();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff653780),
      body: Column(
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                  ),
                  height: 30,
                  width: MediaQuery.of(context).size.width / 2.3,
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
                          "Account",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff653780)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
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
                )
              ],
            ),
          ),
          SizedBox(height: 60),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45))),
                    height: MediaQuery.of(context).size.height / 1.1,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 70),
                        Transform.translate(
                          offset: Offset(0, -15),
                          child: Text(
                            "${firstname} ${lastname}",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xffF89F5B)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: controllers[0],
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 15),
                                labelText: "Name",
                                labelStyle: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                hintText: "Ali",
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                suffixIcon:
                                    Image.asset("assets/Group 11972.png")),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: controllers[1],
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 15),
                                labelText: "Last Name",
                                labelStyle: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                hintText: "Asghar",
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                suffixIcon:
                                    Image.asset("assets/Group 11972.png")),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: controllers[2],
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 15),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                hintText: "Ali Asghar@gmail.com",
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                suffixIcon:
                                    Image.asset("assets/Group 11972.png")),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controllers[3],
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 15),
                                labelText: "Phone Number",
                                labelStyle: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                hintText: "03216588901",
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                suffixIcon:
                                    Image.asset("assets/Group 11972.png")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 15, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 80,
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon:  SizedBox.shrink(),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),

                              ),
                              SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "Date of Birth",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xffE2E1E1)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  height: 45,
                                  width: 40,
                                  child: DropdownButtonFormField(
                                    icon: SvgPicture.asset(
                                        "assets/Drop down.svg"),
                                    value: "05",
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          "05",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "05",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "06",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "06",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "07",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "07",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "08",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "08",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "09",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "09",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "10",
                                      )
                                    ],
                                    onChanged: (value) {
                                      print("changed");
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  height: 45,
                                  width: 40,
                                  child: DropdownButtonFormField(
                                    icon: SvgPicture.asset(
                                        "assets/Drop down.svg"),
                                    value: "14",
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          "14",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "14",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "15",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "15",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "16",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "16",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "17",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "17",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "18",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "18",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "19",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        value: "19",
                                      )
                                    ],
                                    onChanged: (value) {
                                      print("changed");
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  height: 45,
                                  width: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "2012",
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffC0BDBD)),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 140,
                          height: 32,
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                          title: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100),
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
                                                        primary:
                                                            Color(0xff9C3587),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32))),
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.white),
                                                    )),
                                              ),
                                              SizedBox(width: 20),
                                              SizedBox(
                                                width: 100,
                                                height: 32,
                                                child: ElevatedButton(
                                                    onPressed: () async{
                                                      Map<String, dynamic> body = {

                                                        "firstname": controllers[0].text.toString(),
                                                        "lastname": controllers[1].text.toString(),
                                                        "email": controllers[2].text.toString(),
                                                        "phonenumber": controllers[3].text.toString(),
                                                        "city": dropdownValue.toString(),
                                                        "dateofbirth": "dateofbirth",
                                                      };
                                                      await ApiServiceForUpdateUserInfo.UpdateUserInfo(body);
                                                      setState(() {

                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        primary:
                                                            Color(0xffFFFFFF),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32))),
                                                    child: Text(
                                                      "Save",
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Color(
                                                              0xff9C3587)),
                                                    )),
                                              ),
                                            ],
                                          )),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32))),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 11, color: Color(0xff9C3587)),
                              )),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: 140,
                          height: 32,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff9C3587),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32))),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: Offset(0, -20),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF89F5B)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        height: 70,
                        width: 70,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/pngwing.com (2).png",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 50),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffF89F5B),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                  "assets/Iconly-Bold-Edit.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
