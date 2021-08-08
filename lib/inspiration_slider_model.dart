import 'dart:convert';

import 'package:http/http.dart' as http;

class Inspiration{
  final String title;
  final String image;

  Inspiration({required this.title, required this.image});

  factory Inspiration.fromJson(Map<String, dynamic> json){
    return Inspiration(title: json['title'], image: json['image']);
  }
}

Future <List<Inspiration>> fetchInspiration() async{
  final response = await http.get(Uri.parse('https://my-json-server.typicode.com/Drzaln/learn-flutter-v2/inspirationPlace'));
  if(response.statusCode == 200){
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => new Inspiration.fromJson(e)).toList();
  }else{
    throw Exception('Failed to load list');
  }
}