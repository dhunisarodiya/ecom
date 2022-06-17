import 'dart:html';

import 'package:flutter/material.dart';

class json extends StatefulWidget {
  const json({Key? key}) : super(key: key);

  @override
  State<json> createState() => _jsonState();
}

class _jsonState extends State<json> {

  List<Map> list=[
    {
      "albumId":1,
      "id":1,
      "title":"BuildContext context",
      "url":"http://placehold.it/600/92c950",
      "thumbnailUrl":"http://placehold.it/150/92c95"
    },
    {
      "albumId":1,
      "id":2,
      "title":"BuildContext context context",
      "url":"http://placehold.it/600/771796",
      "thumbnailUrl":"http://placehold.it/150/771796"
    },
    {
      "albumId":1,
      "id":3,
      "title":"BuildContext context BuildContext",
      "url":"http://placehold.it/600/24f355",
      "thumbnailUrl":"http://placehold.it/150/24f355"
    },
  ];
  Map map4={
    "id":1,
    "name":"productName",
    "images":[
      {
        "id":11,
        "imageName":"xCh-thy"
      },
      {
        "id":31,
        "imageName":"fjs-eun"
      }
    ]
  };
  Map map3={
    "shape_name":"rectangle",
    "property":{
      "width":5.0,
      "breadth":10.0
    }
  };
  Map map2={
    "city":"mimbai",
    "streets":[
      "address1",
      "address2"]
  };
  Map map1={
    "id":"6574",
    "name":"bhvks",
    "score":132,
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Welcome welcome=Welcome.json(map1);
    print("id==${welcome.id}");

    Welcome1 welcome1=Welcome1.wel(map2);
    print("streets==${welcome1.streets[1]}");


    Welcome3 welcome3 =Welcome3.fromjson(map3);
    print("property==${welcome3.property.width}");

    Welcome4 welcome4 =Welcome4.fromjson(map4);
    print("imageName==${welcome4.images[1].imageName}");

    List<Welcom5> temp=[];
    print("url==${temp[1].url}");

    for(int i=0;i<list.length;i++)
      {
        Welcom5 wlc=Welcom5.fromjson(list[i]);
        temp.add(wlc);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
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

class Welcome1 {

  // {
  // "city":"mimbai",
  // "streets":["address1",
  // "address2"]
  // }
  String city;
  List<String> streets;
  Welcome1(this.city, this.streets); //   "city":"mimbai",
  factory Welcome1.wel(Map map2) {
    return Welcome1(map2['city'], map2['streets']);
  }
}

class Welcome3 {
  // {
  // "shape_name":"rectangle",
  // "property":{
  // "width":5.0,
  // "breadth":10.0
  // }
  // }
  String shape_name;
  Property property;

  Welcome3(this.shape_name, this.property);

  factory Welcome3.fromjson(Map map3) {
    return Welcome3(map3['shape_name'], Property.fromjson(map3['property']));
  }
}

class Property {
  // {
  // "width":5.0,
  // "breadth":10.0
  // }
  double width;
  double breadth;

  Property(this.width, this.breadth);

  factory Property.fromjson(map3) {
    return Property(map3['width'], map3['breadth']);
  }
}

class Welcome4 {
  // {
  // "id":1,
  // "name":"productName",
  // "images":[
  // {
  // "id":11,
  // "imageName":"xCh-thy"
  // },
  // {
  // "id":31,
  // "imageName":"fjs-eun"
  // }
  // ]
  // }
  int id;
  String name;
  List<Myimages> images;

  Welcome4(this.id, this.name, this.images);

  factory Welcome4.fromjson(Map map4) {
    List<Myimages> temp=[];
    List list=map4['images'];
    for(int i=0;i<list.length;i++)
      {
        Myimages ww=Myimages.fromjson(list[i]);
        temp.add(ww);
      }
    return Welcome4(map4['id'], map4['name'], temp);
  }
}

class Myimages {
  // {
  // "id":11,
  // "imageName":"xCh-thy"
  // }
  int id;
  String imageName;

  Myimages(this.id, this.imageName);

  factory Myimages.fromjson(list) {
    return Myimages(list['id'], list['imageName']);
  }
}

class Welcom5 {
  // {
  // "albumId":1,
  // "id":1,
  // "title":"BuildContext context",
  // "url":"http://placehold.it/600/92c950",
  // "thumbnailUrl":"http://placehold.it/150/92c95"
  // },
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Welcom5(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory Welcom5.fromjson(Map list) {
    return Welcom5(list['albumId'], list['id'], list['title'], list['url'], list['thumbnailUrl']);

  }
}

