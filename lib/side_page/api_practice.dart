import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:novelapp/side_page/model.dart';
import 'package:http/http.dart' as http;

class ApiPractice extends StatefulWidget {
  const ApiPractice({super.key});

  @override
  State<ApiPractice> createState() => _ApiPracticeState();
}

class _ApiPracticeState extends State<ApiPractice> {

Future<List<AlbumList>> getData()async{
  var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
  if(response.statusCode ==200){
    return List<AlbumList>.from(jsonDecode(response.body.toString()).map((e)=>AlbumList.fromJson(e)));
  }
  else{
    throw Exception("Error");
  }
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<AlbumList>>(
        future: getData(),
        builder: (context,snapshot){
        return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context,index){
          if(snapshot.hasData){
            return Container(
              margin: EdgeInsets.all(20),
              height: 20,
              child: Text(snapshot.data![index].title.toString()));
          }
          return Center(child: CircularProgressIndicator(),);
      });
      })
    );
  }
}
























// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:novelapp/side_page/model.dart';
// import 'package:http/http.dart' as http;

// class ApiPractice extends StatefulWidget {
//   const ApiPractice({super.key});

//   @override
//   State<ApiPractice> createState() => _ApiPracticeState();
// }

// class _ApiPracticeState extends State<ApiPractice> {
//   late Future<Album> album;

// Future<Album> getData()async{
// var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
// if(response.statusCode == 200){
//   return Album.fromJson(jsonDecode(response.body));
// }
// else{
//   throw Exception("Error");
// }
// }

// @override
//   void initState() {
//     album = getData();
//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder<Album>(
//         future: getData(),
//         builder: (context,snapshot){
//           if(snapshot.hasData){
//             return Center(child: Text(snapshot.data!.title.toString()));
//           }
//           return Center(child: CircularProgressIndicator());
//       })
//     );
//   }
// }