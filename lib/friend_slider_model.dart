import 'dart:convert';

import 'package:http/http.dart' as http;

class Friend{
  final String title;
  final String image;
  final String desc;

  Friend({required this.title, required this.image, required this.desc});

  factory Friend.fromJson(Map<String, dynamic> json){
    return Friend(title: json['title'], image: json['image'], desc: json['desc']);
  }
}

Future <List<Friend>> fetchFriend() async{
  final response = await http.get(Uri.parse('https://my-json-server.typicode.com/Drzaln/learn-flutter-v2/nightIn'));
  if(response.statusCode == 200){
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => new Friend.fromJson(e)).toList();
  }else{
    throw Exception('Failed to load list');
  }
}