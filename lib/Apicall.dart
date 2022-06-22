import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class apicall extends StatefulWidget {
  const apicall({Key? key}) : super(key: key);

  @override
  State<apicall> createState() => _apicallState();
}

class _apicallState extends State<apicall> {
  // List<Myclass> list=[];
  List<Myproducts> list1=[];
  List<Myusers> list2=[];
  bool status=false;

  @override
  Widget build(BuildContext context) {
    return status?Scaffold(
      body: ListView.builder(itemCount: list2.length,itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network("https://media.istockphoto.com/photos/"
                "mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w="
                "0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=",fit: BoxFit.fill,
           ),
          title: Text("${list2[index].password}"),
          subtitle: Text("${list2[index].address!.geolocation!.lat} , ${list2[index].name}"),
        );
      },),
    )  :Center(child: CircularProgressIndicator());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // forapi();
    // forproducts();
    forusers();
  }

   // forapi() async {
   //   var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
   //   var response = await http.get(url);
   //   print('Response status: ${response.statusCode}');
   //   print('Response body: ${response.body}');
   //   List ress=jsonDecode(response.body);
   //   setState(() {
   //     for(int i=0;i<ress.length;i++)
   //       {
   //         Myclass mc=Myclass.fromJson(ress[i]);
   //         list.add(mc);
   //       }
   //     status=true;
   //   });
   //
   // }
   // forproducts() async{
   //   var url = Uri.parse('https://fakestoreapi.com/products');
   //   var response = await http.get(url);
   //   print('Response status: ${response.statusCode}');
   //   print('Response body: ${response.body}');
   //   developer.log('${response.body}');
   //   List pro=jsonDecode(response.body);
   //   setState(() {
   //     for(int i=0;i<pro.length;i++)
   //       {
   //         Myproducts myproducts=Myproducts.fromJson(pro[i]);
   //         list1.add(myproducts);
   //       }
   //     status=true;
   //   });
   //
   // }
   forusers() async {
     var url = Uri.parse('https://fakestoreapi.com/users');
     var response = await http.get(url);
     print('Response status: ${response.statusCode}');
     print('Response body: ${response.body}');

     List users=jsonDecode(response.body);
     setState(() {
       for(int i=0;i<users.length;i++)
         {
           Myusers myusers=Myusers.fromJson(users[i]);
           list2.add(myusers);
         }
       status=true;
     });
   }
}
// class Myclass {
//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   Address? address;
//   String? phone;
//   String? website;
//   Company? company;
//
//   Myclass(
//       {this.id,
//         this.name,
//         this.username,
//         this.email,
//         this.address,
//         this.phone,
//         this.website,
//         this.company});
//
//   Myclass.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     username = json['username'];
//     email = json['email'];
//     address =
//     json['address'] != null ? new Address.fromJson(json['address']) : null;
//     phone = json['phone'];
//     website = json['website'];
//     company =
//     json['company'] != null ? new Company.fromJson(json['company']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     if (this.address != null) {
//       data['address'] = this.address!.toJson();
//     }
//     data['phone'] = this.phone;
//     data['website'] = this.website;
//     if (this.company != null) {
//       data['company'] = this.company!.toJson();
//     }
//     return data;
//   }
// }
//
// class Address {
//   String? street;
//   String? suite;
//   String? city;
//   String? zipcode;
//   Geo? geo;
//
//   Address({this.street, this.suite, this.city, this.zipcode, this.geo});
//
//   Address.fromJson(Map<String, dynamic> json) {
//     street = json['street'];
//     suite = json['suite'];
//     city = json['city'];
//     zipcode = json['zipcode'];
//     geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['street'] = this.street;
//     data['suite'] = this.suite;
//     data['city'] = this.city;
//     data['zipcode'] = this.zipcode;
//     if (this.geo != null) {
//       data['geo'] = this.geo!.toJson();
//     }
//     return data;
//   }
// }
//
// class Geo {
//   String? lat;
//   String? lng;
//
//   Geo({this.lat, this.lng});
//
//   Geo.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lng = json['lng'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     return data;
//   }
// }
//
// class Company {
//   String? name;
//   String? catchPhrase;
//   String? bs;
//
//   Company({this.name, this.catchPhrase, this.bs});
//
//   Company.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     catchPhrase = json['catchPhrase'];
//     bs = json['bs'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['catchPhrase'] = this.catchPhrase;
//     data['bs'] = this.bs;
//     return data;
//   }
// }

class Myproducts {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Myproducts(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  Myproducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}class Myusers {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  Myusers(
      {this.address,
        this.id,
        this.email,
        this.username,
        this.password,
        this.name,
        this.phone,
        this.iV});

  Myusers.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    phone = json['phone'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['phone'] = this.phone;
    data['__v'] = this.iV;
    return data;
  }
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address(
      {this.geolocation, this.city, this.street, this.number, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    geolocation = json['geolocation'] != null
        ? new Geolocation.fromJson(json['geolocation'])
        : null;
    city = json['city'];
    street = json['street'];
    number = json['number'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geolocation != null) {
      data['geolocation'] = this.geolocation!.toJson();
    }
    data['city'] = this.city;
    data['street'] = this.street;
    data['number'] = this.number;
    data['zipcode'] = this.zipcode;
    return data;
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  Name.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}


