import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:novelapp/side_page/model.dart';

class ApiPractice extends StatefulWidget {
  const ApiPractice({super.key});

  @override
  State<ApiPractice> createState() => _ApiPracticeState();
}

class _ApiPracticeState extends State<ApiPractice> {
  late Future<Album> futureData;

  Future<Album> getApiData()async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
    if(response.statusCode == 200){
      return Album.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Error");
    }
  }

  @override
  void initState() {
    futureData = getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Album>(
        future: futureData,
        builder: (context,snapshot){
          if(snapshot.hasData){
           return Center(child: Text(snapshot.data!.title.toString()));
          }
          return CircularProgressIndicator();
      })
    );
  }
}