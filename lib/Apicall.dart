import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class apicall extends StatefulWidget {
  const apicall({Key? key}) : super(key: key);

  @override
  State<apicall> createState() => _apicallState();
}

class _apicallState extends State<apicall> {
  List<Myclass> list=[];
  bool status=false;

  @override
  Widget build(BuildContext context) {
    return status?Scaffold(
      body: ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
        return ListTile(
          title: Text("${list[index].id}"),
          subtitle: Text("${list[index].address!.city}"),
        );
      },),
    )  :Center(child: CircularProgressIndicator());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forapi();
  }

   forapi() async {
     var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
     var response = await http.get(url);
     print('Response status: ${response.statusCode}');
     print('Response body: ${response.body}');
     List ress=jsonDecode(response.body);
     setState(() {
       for(int i=0;i<ress.length;i++)
         {
           Myclass mc=Myclass.fromJson(ress[i]);
           list.add(mc);
         }
       status=true;
     });

   }
}
class Myclass {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  Myclass(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company});

  Myclass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo!.toJson();
    }
    return data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}

