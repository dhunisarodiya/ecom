import 'dart:convert';
import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  bool namestatus=false;
  bool numberstatus=false;
  bool datestatus=false;
  bool passwordstatus=false;
  bool emailstatus=false;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    double ttheight=MediaQuery.of(context).size.height;
    double ttwidth=MediaQuery.of(context).size.width;
    double statusbar=MediaQuery.of(context).padding.top;
    double nagibar=MediaQuery.of(context).padding.bottom;
    double appbarheight=kToolbarHeight;

    double tbody=ttheight-statusbar-nagibar;
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(height: tbody,
              width: ttwidth,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/img.png"),
                fit: BoxFit.fill)),
              child: Column(children: [
                InkWell(onTap: () {
                  showDialog(builder: (context) {
                    return Dialog(
                      child: Column(children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            Navigator.pop(context);
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              img=image!.path;
                            });
                          },
                          icon: Icon(Icons.photo),
                          label: Text("Gallery")),
                        ElevatedButton.icon(
                          onPressed: () async {
                            Navigator.pop(context);
                            final XFile? photo = await _picker.pickImage(
                                source: ImageSource.camera);
                            setState(() {
                              img=photo!.path;
                            });
                          },
                          icon: Icon(Icons.camera),
                          label: Text("Camera")),

                      ],),);
                  },context: context);
                },
                  child: img!="" ? Center(
                    child: Container(
                      child: CircleAvatar(radius: 90,
                          backgroundImage:FileImage(File(img))
                      ),),
                  ) :Center(
                    child: Container(
                      child: CircleAvatar(radius: 90,
                        backgroundImage:
                        AssetImage("images/user.png"
                        ),
                      ),),
                  ),
                ),
                Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
                  child: TextField(controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      labelText: "Enter Name",
                      hintText: "enter name",
                      errorText: namestatus?aa:null
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
                  child: TextField(controller: number,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      labelText: "Enter Number",
                      hintText: "enter number",
                      errorText: numberstatus?aa:null
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
                  child: DateTimePicker(controller: dateofbirth,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      labelText: "Enter dob",
                      hintText: "enter dob",
                      errorText: datestatus?aa:null,
                    ),
                    type: DateTimePickerType.date,
                    dateHintText: "select date",
                    firstDate: DateTime(1995),
                    lastDate: DateTime.now(),
                  ),
                ),
                Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
                  child: TextField(controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      labelText: "Enter password",
                      hintText: "enter password",
                      errorText: passwordstatus? aa:null
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
                  child: TextFormField(controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                      labelText: "Enter Email",
                      hintText: "enter email",
                      errorText: emailstatus?aa:null
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  namestatus=false;
                  numberstatus=false;
                  datestatus=false;
                  passwordstatus=false;
                  emailstatus=false;
                  String namee=name.text;
                  String numberr=number.text;
                  String date=password.text;
                  String pass=password.text;
                  String emaill=password.text;

                  // List<int> iii=File(img).readAsBytesSync();
                  // String imagedata=base64Encode(iii);
                  setState(()  {

                    if (name.text.length == 0)
                    {
                      namestatus=true;
                      aa= 'Please enter full name';
                    }
                    else if (!RegExp( r'^[a-z A-Z,.\-]+$').hasMatch(namee))
                    {
                      namestatus=true;
                      aa= 'Please enter valid full name';
                    }
                    else if (number.text.length == 0)
                    {
                      numberstatus=true;
                      aa= 'Please enter mobile number';
                    }
                    else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(numberr))
                    {
                      numberstatus=true;
                      aa= 'Please enter valid mobile number';
                    }
                    else if (dateofbirth.text=="")
                    {
                      datestatus=true;
                      aa= 'enter your birth date';
                    }
                    else if(password.text=="")
                    {
                      passwordstatus=true;
                      aa="enter password";
                    }
                    else if (password.text.length < 8)
                    {
                      passwordstatus=true;
                      aa= "Password has at least 8 characters\n";
                    }
                    else if (!RegExp("(?=.*[A-Z])").hasMatch(pass))
                    {
                      passwordstatus=true;
                      aa= "Password must contain one uppercase letter\n";
                    }
                    else if(!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(pass))
                    {
                      passwordstatus=true;
                      aa="Password must contain special characters letter\n";
                    }
                    else if (email.text == "") {
                      emailstatus=true;
                      aa= 'Enter your Address';
                    }
                    else if (email.text.contains('@') ==false)
                    {
                      emailstatus=true;
                      aa= 'Enter a Valid Email Address';
                    }
                    else if(email.text.contains('gmail.com')==false)
                    {
                      emailstatus=true;
                      aa= 'plese Enter a Valid Email Address';
                    }
                    else
                    {
                      Map map={
                        "name":namee,
                        "email":emaill,
                        "number":numberr,
                        "dob":date,
                        "password":pass,
                        // "imagedata":imagedata
                      };
                      // var url = Uri.parse('https://example.com/whatsit/create');
                      // var response = await http.post(url, body: map);
                      // print('Response status: ${response.statusCode}');
                      // print('Response body: ${response.body}');

                    }
                  });
                },child: Text("Sign Up"))
              ],),
            ),
          ),


        )), onWillPop: onback);
  }
  String aa="";
  String img="";
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController dateofbirth=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();

  Future<bool> onback() {
    showDialog(builder: (context) {
      return AlertDialog(actions: [
        FlatButton(onPressed: () {
          Navigator.pop(context);

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return ecom();
          },));

        }, child: Text("Yes")),
        FlatButton(onPressed: () {
          Navigator.pop(context);

        }, child: Text("No"))
      ],
      title: Text("Are You Sure You Want To Exit ?"),);
    },context: context);

    return Future.value(true);
  }
}