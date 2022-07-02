import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class apicalling extends StatefulWidget {
  const apicalling({Key? key}) : super(key: key);

  @override
  State<apicalling> createState() => _apicallingState();
}

class _apicallingState extends State<apicalling> {

  List<Mycla> list=[];
  bool status=false;
  @override
  Widget build(BuildContext context) {
    return status?
    Scaffold(
      body: ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
        return ListTile(
         title: Text("${list[index].status}"),
        );
      },),
    )
       :Center(child: CircularProgressIndicator());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forprod();


  }

 forprod() async {
   var url = Uri.parse('https://dummy.restapiexample.com/api/v1/employees');
     var response = await http.get(url);
     print('Response status: ${response.statusCode}');
     print('Response body: ${response.body}');
     List ress=jsonDecode(response.body);
       setState(() {
         for(int i=0;i<ress.length;i++)
           {
             Mycla mc=Mycla.fromJson(ress[i]);
             list.add(mc);
           }
         status=true;
       });
 }

}
class Mycla {
  String? status;
  List<Data>? data;

  Mycla({this.status, this.data});

  Mycla.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  Data(
      {this.id,
        this.employeeName,
        this.employeeSalary,
        this.employeeAge,
        this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeName = json['employee_name'];
    employeeSalary = json['employee_salary'];
    employeeAge = json['employee_age'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_name'] = this.employeeName;
    data['employee_salary'] = this.employeeSalary;
    data['employee_age'] = this.employeeAge;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
