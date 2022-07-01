import 'package:ecom/second.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: ecom(),));
}
class ecom extends StatefulWidget {
  const ecom({Key? key}) : super(key: key);

  @override
  State<ecom> createState() => _ecomState();
}

class _ecomState extends State<ecom> {
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  bool namestatus=false;
  bool passwordstatus=false;
  @override
  Widget build(BuildContext context) {
    double theight=MediaQuery.of(context).size.height;
    double twidth=MediaQuery.of(context).size.width;
    double statusbar=MediaQuery.of(context).padding.top;
    double nagibar=MediaQuery.of(context).padding.bottom;
    double appbarheight=kToolbarHeight;

    double body=theight-statusbar-nagibar;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(height: body,
          width: twidth,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/n4.jpg"),fit: BoxFit.fill)),
          child:  Column(children: [
            Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: TextField(controller: name,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1,color: Colors.black),),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: "Enter Name",
                    hintText: "enter name",
                    errorText: namestatus?bb:null
                ),
              ),
            ),
            Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: TextField(controller: password,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1,color: Colors.amber),),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: "Enter password",
                    hintText: "enter your password",
                    errorText: passwordstatus?bb:null
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              namestatus=false;
              passwordstatus=false;
              String na=name.text;
              String pw=password.text;

              setState(() {

                // String patttern = r'^[a-z A-Z,.\-]+$';
                // RegExp fname = new RegExp(patttern);
                // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                // RegExp fnumber = new RegExp(pattern);
                // String patternn=r'[!@#$%^&*(),.?":{}|<>]';
                // RegExp pass=new RegExp(patternn);
                if (name.text.length == 0) {
                  namestatus=true;
                  bb= 'Please enter full name';
                }
                else if (!RegExp( r'^[a-z A-Z,.\-]+$').hasMatch(na)) {
                  namestatus=true;
                  bb= 'Please enter valid full name';
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
                  bb= "Password must contain at least one uppercase letter\n";
                }
                else if(!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(pw))
                {
                  passwordstatus=true;
                  bb="Password must contain at least special characters letter\n";
                }
              });
            },child: Text("Sign Up")),
            Container(margin: EdgeInsets.fromLTRB(00, 05, 00,05 ),),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return second();
              },));
            }, child: Text("Register"),)
          ],),
        ),
      ),
    );
  }
  String bb="";

}



