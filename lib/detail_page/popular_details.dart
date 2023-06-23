// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopularDetails extends StatefulWidget {
 

  @override
  State<PopularDetails> createState() => _PopularDetailsState();
}

class _PopularDetailsState extends State<PopularDetails> {
String value = "";


savedData()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 value = prefs.getString('manish').toString();
setState(() {
  
});
}
@override
  void initState() {
   savedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(value),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/637696304/photo/patan.jpg?s=612x612&w=0&k=20&c=-53aSTGBGoOOqX5aoC3Hs1jhZ527v3Id_xOawHHVPpg=",),fit: BoxFit.cover)
              ),
            ),
            Positioned(
             bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.7,
               width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                 )
              ),
              ),
            )
          ],
        ),
      )
    );
  }
}
