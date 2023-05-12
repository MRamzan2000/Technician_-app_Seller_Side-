// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:technician_seller_side/Sign_In/Sign_in.dart';
//
// import '../All_APis/ApiServiceForSignup.dart';
// import '../Map/map.dart';
//
// class Otp extends StatefulWidget {
//   final String code;
//   final String id;
//   final String firstname;
//   final String lastname;
//   final String email;
//   final String pass;
//   final String phone;
//   final String city;
//   final String dob;
//   const Otp({required this.code, required this.id, required this.firstname, required this.lastname, required this.email, required this.pass, required this.phone, required this.city, required this.dob});
//   @override
//   _OtpState createState() => _OtpState();
// }
//
// class _OtpState extends State<Otp> {
//
//   TextEditingController one =TextEditingController();
//   TextEditingController two =TextEditingController();
//   TextEditingController three =TextEditingController();
//   TextEditingController four =TextEditingController();
//   upload(){
//     setState(() {
//
//       _loading  =true;
//     });
//     Map<String, dynamic> body = {
//
//       "firstname": widget.firstname,
//       "lastname": widget.lastname,
//       "email": widget.email,
//       "password": widget.pass,
//       "phonenumber": widget.phone,
//       "city": widget.city,
//       "dateofbirth": widget.dob,
//       "idofiqama": widget.id
//
//
//     };
//     ApiServiceForSignup.signup(body).then((value) => {
//
//       if(value.message  == "Seller created successfully"){
//
//         Navigator.of(context).push(
//             MaterialPageRoute(builder: (BuildContext context) {
//               return MapSample();
//             })),
//
//     ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar( content: Text('Seller Created Successfuly!'), )),
//         setState(() {
//
//           _loading  =false;
//         })
//
//
//       }
//
//       else{
//         setState(() {
//
//           _loading  =false;
//         }),
//         showDialog(
//           context: context,
//           builder: (BuildContext context) => CupertinoAlertDialog(
//             title: value.error == null ? Text(value.message.toString()) : Text(value.error.toString()),
//             content: Text(value.message.toString()),
//             actions: <Widget>[
//               CupertinoDialogAction(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text("Ok"),
//               ),
//             ],
//           ),
//         )
//       }
//     });
//   }
//   bool _loading = false;
//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: _loading,
//
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Color(0xfff7f6fb),
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Icon(
//                       Icons.arrow_back,
//                       size: 32,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Text(
//                   'Verification',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Enter your OTP code number",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black38,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 28,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(28),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _textFieldOTP(first: true, last: false, contoler: one),
//                           _textFieldOTP(first: false, last: false, contoler: two),
//                           _textFieldOTP(first: false, last: false, contoler: three),
//                           _textFieldOTP(first: false, last: true, contoler: four),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 22,
//                       ),
//                       SizedBox(
//                         height: 35,
//                         width: 150,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             print(one.text+two.text+three.text+four.text);
//                             upload();
//
//                           },
//                           style: ButtonStyle(
//                             foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                             backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.purple),
//                             shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(24.0),
//                               ),
//                             ),
//                           ),
//                           child: Text(
//                             'Verify',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _textFieldOTP({required bool first, last, required contoler}) {
//     return Container(
//       height: 65,
//       child: AspectRatio(
//         aspectRatio: 1.0,
//         child: TextField(
//           controller: contoler,
//           autofocus: true,
//           onChanged: (value) {
//             if (value.length == 1 && last == false) {
//               FocusScope.of(context).nextFocus();
//             }
//             if (value.length == 0 && first == false) {
//               FocusScope.of(context).previousFocus();
//             }
//           },
//           showCursor: false,
//           readOnly: false,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           keyboardType: TextInputType.number,
//           maxLength: 1,
//           decoration: InputDecoration(
//             counter: Offstage(),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: Colors.black12),
//                 borderRadius: BorderRadius.circular(12)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 2, color: Colors.purple),
//                 borderRadius: BorderRadius.circular(12)),
//           ),
//         ),
//       ),
//     );
//   }
// }