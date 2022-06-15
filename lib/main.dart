import 'dart:convert';
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
  // bool namestatus=false;
  // TextEditingController name=TextEditingController();
  // Map map={
  //   "id":"67899",
  //   "name":"namee",
  //   "score":100
  // };
  //
  // Come come=Come.fromjson(Map);



  @override
  Widget build(BuildContext context) {
    Map map1={
      "id":"6574",
      "name":"bhvks",
      "score":132,
    };
    Welcome welcome=Welcome.json(map1);
    print("==${welcome.id}");
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          InkWell(onTap: () {
            showDialog( builder: (context) {
              return Dialog(
                child: Column(children: [
                  ElevatedButton.icon(onPressed: () async {
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      imag=image!.path;
                      Navigator.pop(context);
                      });
                    },
                    icon: Icon(Icons.photo), label: Text("gallery",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),)),
                  ElevatedButton.icon(onPressed: () async {
                    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                    setState(() {
                      imag=photo!.path;
                      Navigator.pop(context);
                     });
                    },
                    icon: Icon(Icons.camera), label: Text("camera",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),))
                  ],),
                );
              },context: context);
            },
            child:imag!="" ?
            Center(
              child: Container(
                child: CircleAvatar(radius: 100,
                  backgroundImage: FileImage(File(imag)),),),
              )
            :Center(
              child: Container(
                child: CircleAvatar(radius: 100,
                  backgroundImage: AssetImage("images/user.png"),),),
              ),
           ),
          Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: TextField(//controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Enter Name",
                hintText: "enter name",
                //errorText: namestatus?"Enter your valid name" :null
              ),
            ),
          ),
          // ElevatedButton(onPressed: () {
          //   namestatus=false;
          //   String nam=name.text;
          //   setState(() {
          //     if(name=="")
          //       {
          //         namestatus=true;
          //       }
          //   });
          //
          // },child: Text("Sign Up"))
      ],)
      ),
    );
  }
  String imag="";

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
    // print("==${}");
    return Welcome(map1['id'], map1['name'], map1['score']);
  }
}

// class Come {
//   String id;
//   String name;
//   int score;
//   Come(this.id, this.name, this.score);
//   // "id":"67899",
//   // "name":"namee",
//   // "score":100
//
//   factory Come.fromjson(Map) {
//
//
//     return Come(Map['id'], Map['name'], Map['score']);
//
//   }
// }


