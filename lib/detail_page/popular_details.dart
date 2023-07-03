// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

class PopularDetail extends StatefulWidget {
var popularData;
PopularDetail({required this.popularData});

  @override
  State<PopularDetail> createState() => _PopularDetailState();
}

class _PopularDetailState extends State<PopularDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.popularData.image,),fit: BoxFit.cover)
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(10),
              width: size.width,
              height: size.height*0.70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Column(
                children: [
                  CustomText(name: widget.popularData.title,size: 20,weight: FontWeight.w600,color: Colors.black,),
                  SizedBox(height: 15,),
                  CustomText(name: widget.popularData.description, color: Colors.black, size: 15, weight: FontWeight.w400)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
String name;
Color color;
FontWeight weight;
double size;
  CustomText({required this.name,required this.color,required this.size,required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.justify,
      style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color
    ),);
  }
}
