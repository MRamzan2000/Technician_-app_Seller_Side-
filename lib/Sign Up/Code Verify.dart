import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../All_APis/ApiServiceForSignup.dart';
import '../Sign_In/Sign_in.dart';

class CodeVerify extends StatefulWidget {
  final String code;
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String pass;
  final String phone;
  final String city;
  final String dob;
  const CodeVerify({Key? key, required this.id,required this.code, required this.firstname, required this.lastname, required this.email, required this.pass, required this.phone, required this.city, required this.dob}) : super(key: key);

  @override
  State<CodeVerify> createState() => _CodeVerifyState();
}

class _CodeVerifyState extends State<CodeVerify> {
  upload(){
    setState(() {

      _loading  =true;
    });
    Map<String, dynamic> body = {

      "firstname": widget.firstname,
      "lastname": widget.lastname,
      "email": widget.email,
      "password": widget.pass,
      "phonenumber": widget.phone,
      "city": widget.city,
      "dateofbirth": widget.dob,
      "idofiqama": widget.id


    };
    ApiServiceForSignup.signup(body).then((value) => {

      if(value.message  == "Seller created successfully"){

        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return Sign_in();
            })),
        setState(() {

          _loading  =false;
        })


      }

      else{
        setState(() {

          _loading  =false;
        }),
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: value.error == null ? Text(value.message.toString()) : Text(value.error.toString()),
            content: Text(value.message.toString()),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ],
          ),
        )
      }
    });
  }
  bool _loading = false;
  TextEditingController verifycode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(

        body: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 150,),
            Text("Code has been sent your phone :"),
            Text("Enter the your Code  :"),


            Container(
              height: 35,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.5
                  )
                ],
                color: Colors.white,


              ),
              child: TextField(
                keyboardType: TextInputType.number,

                controller: verifycode,
                decoration: InputDecoration(
                  hintText: "Enter Your Code"
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              if(widget.code == verifycode.text){
                upload();
              }
              else{
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Error'),
                      content: Text("Invalild Code"),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('OK'),
                          onPressed: () {
                            // Perform some action
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }


            }, child: const Text("Verify"))
          ],
        ),
      ),
    );
  }
}
