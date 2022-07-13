import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product page"),centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return addproduct();
                  },
                ));
              },
              title: Text(
                "Add product",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return viewpoduct();
                  },
                ));
              },
              title: Text(
                "View product",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        )
      )
    );
  }
}

class addproduct extends StatefulWidget {
  const addproduct({Key? key}) : super(key: key);

  @override
  State<addproduct> createState() => _addproductState();
}

class _addproductState extends State<addproduct> {
  TextEditingController name=TextEditingController();
  TextEditingController price=TextEditingController();
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body:SafeArea(
          child:  Column(children: [
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
              ),
            ),
          ),
          Container(margin: EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: TextField(controller: price,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Enter price",
                hintText: "enter price",
              ),
            ),
          ),
        ],))

        ),
      onWillPop: onback);
  }
  String img="";
  Future<bool> onback() {
    showDialog(
        builder: (context) {
          return AlertDialog(
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return product();
                      },
                    ));
                  },
                  child: Text("Yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],
            title: Text("Are You Sure You Want To Exit ?"),
          );
        },
        context: context);

    return Future.value(true);
  }
}

class viewpoduct extends StatefulWidget {
  const viewpoduct({Key? key}) : super(key: key);

  @override
  State<viewpoduct> createState() => _viewpoductState();
}

class _viewpoductState extends State<viewpoduct> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(backgroundColor: Colors.blue,
          body: Container(
            color: Colors.blue,
          ),
        ),
        onWillPop: onback);
  }

  Future<bool> onback() {
    showDialog(
        builder: (context) {
          return AlertDialog(
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return product();
                      },
                    ));
                  },
                  child: Text("Yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],
            title: Text("Are You Sure You Want To Exit ?"),
          );
        },
        context: context);

    return Future.value(true);
  }
}
