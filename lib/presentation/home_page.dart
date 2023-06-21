import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:novelapp/presentation/slider_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: SafeArea(child: 
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              TopBar(size: size),
              SizedBox(height: 10,),
              TextPart(),
              SliderPart(size: size),
              ItemsTopic(size: size,name: "Popular Items",),
              PopularItems(),
              SizedBox(height: 10,),
               ItemsTopic(size: size,name: "Recent Release",),
               ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: size.width,
                    child: Row(
                      children: [
                        Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width*0.35,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/637696304/photo/patan.jpg?s=612x612&w=0&k=20&c=-53aSTGBGoOOqX5aoC3Hs1jhZ527v3Id_xOawHHVPpg="),
                            fit: BoxFit.cover
                            ),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width*0.58,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            boxShadow: [
                                BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(-2, 2)
              )
            
                            ]
                          ),
                        )
                      ],
                    ),
                  );
               })
            ],
          ),
        )
        ),
      ),
    );
  }
}

class PopularItems extends StatelessWidget {
  const PopularItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.all(10),
          height: 190,
          width: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(-2, 2)
              )
            ]
          ),
          child: Column(
            children: [
              Container(
                height: 140,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                  ),
                  image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/637696304/photo/patan.jpg?s=612x612&w=0&k=20&c=-53aSTGBGoOOqX5aoC3Hs1jhZ527v3Id_xOawHHVPpg="),
                  fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 10,),
              Text("War Time",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),)
            ],
          ),
        );
      }),
    );
  }
}

class ItemsTopic extends StatelessWidget {
  final Size size;
  String name;
  ItemsTopic({required this.size,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 30,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
          ),
          Text("See All",style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.green
          ),
          )
        ],
      ),
    );
  }
}



class TextPart extends StatelessWidget {
  const TextPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu,color: Colors.green,size: 25,),
          Text("HomePage",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
          ),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
            child: Icon(Icons.arrow_downward,color: Colors.white,))
        ],
      ),
    );
  }
}