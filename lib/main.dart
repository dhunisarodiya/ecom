import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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
  final ImagePicker _picker = ImagePicker();
  bool namestatus=false;
  bool numberstatus=false;
  bool passwordstatus=false;
  bool emailstatus=false;
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();

  Map map1={
    "id":"6574",
    "name":"bhvks",
    "score":132,
  };

  Map map2={
    "city":"mimbai",
    "streets":["address1",
    "address2"]
  };
  @override
  Widget build(BuildContext context) {

    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbar = MediaQuery.of(context).padding.top;
    double nagibar = MediaQuery.of(context).padding.bottom;
    double appbarheight = kToolbarHeight;

    double body = theight - statusbar - nagibar - appbarheight;
    Welcome welcome=Welcome.json(map1);
    Welcome1 welcome1=Welcome1.wel(map2);

    print("id==${welcome.id}");
    print("streets==${welcome1.streets[1]}");
    return Container();
    // Scaffold(
    //   body: SafeArea(
    //       child: Column(children: [
    //         InkWell(onTap: () {
    //           showDialog( builder: (context) {
    //             return Dialog(
    //               child: Column(children: [
    //                 ElevatedButton.icon(onPressed: () async {
    //                   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //                   setState(() {
    //                     imag=image!.path;
    //                     Navigator.pop(context);
    //                   });
    //                 },
    //                     icon: Icon(Icons.photo), label: Text("gallery",
    //                       style: TextStyle(
    //                           fontSize: 15,
    //                           fontWeight: FontWeight.bold),)),
    //                 ElevatedButton.icon(onPressed: () async {
    //                   final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    //                   setState(() {
    //                     imag=photo!.path;
    //                     Navigator.pop(context);
    //                   });
    //                 },
    //                     icon: Icon(Icons.camera), label: Text("camera",
    //                       style: TextStyle(
    //                           fontSize: 15,
    //                           fontWeight: FontWeight.bold),))
    //               ],),
    //             );
    //           },context: context);
    //         },
    //           child:imag!="" ?
    //           Center(
    //             child: Container(
    //               child: CircleAvatar(radius: 80,
    //                 backgroundImage: FileImage(File(imag)),),),
    //           )
    //               :Center(
    //             child: Container(
    //               child: CircleAvatar(radius: 80,
    //                 backgroundImage: AssetImage("images/user.png"),),),
    //           ),
    //         ),
    //         Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
    //           height: body/15,
    //           child: TextField(controller: name,
    //             decoration: InputDecoration(
    //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    //                 labelText: "Enter Name",
    //                 hintText: "enter name",
    //                 errorText: namestatus? "Enter your valid name":null
    //             ),
    //           ),
    //         ),
    //         Container(margin: EdgeInsets.fromLTRB(35, 00, 35, 10),
    //           height: body/10,
    //           child: TextField(controller: number,
    //             maxLength: 10,
    //             keyboardType: TextInputType.phone,
    //             decoration: InputDecoration(
    //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    //                 labelText: "Enter Number",
    //                 hintText: "enter number",
    //                 errorText: numberstatus?"Enter your valid number" :null
    //             ),
    //           ),
    //         ),
    //         Container(margin: EdgeInsets.fromLTRB(35, 00, 35, 10),
    //           height: body/15,
    //           child: TextField(controller: password,
    //             decoration: InputDecoration(
    //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    //                 labelText: "Enter password",
    //                 hintText: "enter password",
    //                 errorText: passwordstatus?"Enter your valid password" :null
    //             ),
    //           ),
    //         ),
    //         Container(margin: EdgeInsets.fromLTRB(35, 00, 35, 10),
    //           height: body/15,
    //           child: TextField(controller: email,
    //             decoration: InputDecoration(
    //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    //                 labelText: "Enter Email",
    //                 hintText: "enter email",
    //                 errorText: emailstatus?"Enter your valid email" :null
    //             ),
    //           ),
    //         ),
    //         ElevatedButton(onPressed: () {
    //           namestatus=false;
    //           numberstatus=false;
    //           passwordstatus=false;
    //           emailstatus=false;
    //
    //           setState(() {
    //             if(name.text=="")
    //             {
    //               namestatus=true;
    //             }
    //             if(number.text=="")
    //             {
    //               numberstatus=true;
    //             }
    //             if(password.text=="")
    //             {
    //               passwordstatus=true;
    //             }
    //             if(email.text.contains("@")==false &&
    //                 email.text.contains(".com")==false)
    //             {
    //               emailstatus=true;
    //             }
    //           });
    //
    //         },child: Text("Sign Up"))
    //       ],)
    //   ),
    // );
  }
  String imag="";
}

class Welcome1 {
  String city;
  List<String> streets;

  Welcome1(this.city, this.streets); //   "city":"mimbai",
//   "streets":["address1",
//   "address2"]
// };

  factory Welcome1.wel(Map map2) {
    return Welcome1(map2['city'], map2['streets']);
  }
}
class Welcome {
  // "id":"6574",
  // "name":"bhvks",
  // "score":132
  String id;
  String name;
  int score;

  Welcome(this.id, this.name, this.score);
  factory Welcome.json(Map map1) {
    return Welcome(map1['id'], map1['name'], map1['score']);
  }
}


