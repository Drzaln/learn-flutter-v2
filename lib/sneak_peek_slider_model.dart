import 'dart:convert';

import 'package:http/http.dart' as http;

class SneakPeek{
  final String image;

  SneakPeek({ required this.image});

  factory SneakPeek.fromJson(Map<String, dynamic> json){
    return SneakPeek(image: json['image']);
  }
}

Future <List<SneakPeek>> fetchSneakPeek() async{
  final response = await http.get(Uri.parse('https://my-json-server.typicode.com/Drzaln/learn-flutter-v2/sneakPeek'));
  if(response.statusCode == 200){
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => new SneakPeek.fromJson(e)).toList();
  }else{
    throw Exception('Failed to load list');
  }
}