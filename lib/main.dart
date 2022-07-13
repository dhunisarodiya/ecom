import 'package:ecom/Apicall.dart';
import 'package:ecom/json.dart';
import 'package:ecom/productpage.dart';
import 'package:ecom/second.dart';
import 'package:flutter/material.dart';
import 'apicalling.dart';

void main()
{
  runApp(MaterialApp(home: product(),));
}
class ecom extends StatefulWidget {
  const ecom({Key? key}) : super(key: key);

  @override
  State<ecom> createState() => _ecomState();
}

class _ecomState extends State<ecom> {
  TextEditingController number=TextEditingController();
  TextEditingController password=TextEditingController();
  bool numberstatus=false;
  bool passwordstatus=false;
  @override
  Widget build(BuildContext context) {
    double theight=MediaQuery.of(context).size.height;
    double twidth=MediaQuery.of(context).size.width;
    double statusbar=MediaQuery.of(context).padding.top;
    double nagibar=MediaQuery.of(context).padding.bottom;
    double appbarheight=kToolbarHeight;

    double body=theight-statusbar;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(height: body,
          width: twidth,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/img.png"),fit: BoxFit.fill)),
          child:  Column(children: [
            Container(margin: EdgeInsets.fromLTRB(00, 50, 00,  80),),
            Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: TextField(controller: number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 1,color: Colors.black54),),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Enter number",
                hintText: "enter namber",
                errorText: numberstatus?bb:null
                ),
              ),
            ),
            Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: TextField(controller: password,
                decoration: InputDecoration(
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                  //   borderSide: BorderSide(width: 1,color: Colors.teal),),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Enter password",
                  hintText: "enter your password",
                  errorText: passwordstatus?bb:null
                ),
              ),
            ),
            Container(margin: EdgeInsets.fromLTRB(00, 10, 00, 10),),
            ElevatedButton(onPressed: () {
              numberstatus=false;
              passwordstatus=false;
              String nm=number.text;
              String pw=password.text;

              setState(() {

                if (number.text.length == 0) {
                  numberstatus=true;
                  bb= 'Please enter your number';
                }
                else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(nm)) {
                  numberstatus=true;
                  bb= 'Please enter valid mobile number';
                }
                else if(password.text=="")
                {
                  passwordstatus=true;
                  bb="enter password";
                }
                else if (password.text.length < 8) {
                  passwordstatus=true;
                  bb= "Password has at least 8 characters\n";
                }
                else if (!RegExp("(?=.*[A-Z])").hasMatch(pw)) {
                  passwordstatus=true;
                  bb= "Password must contain one uppercase letter\n";
                }
                else if(!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(pw))
                {
                  passwordstatus=true;
                  bb="Password must contain special characters letter\n";
                }
              });
            },child: Text("Sign Up")),
            Container(margin: EdgeInsets.fromLTRB(00, 10, 00,05 ),),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return second();
              },));
            }, child: Text("Register"),)
          ],),
        ),
      ),
    ));
  }
  String bb="";
}



