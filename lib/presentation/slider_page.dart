import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class SliderPart extends StatefulWidget {
  const SliderPart({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<SliderPart> createState() => _SliderPartState();
}

class _SliderPartState extends State<SliderPart> {
  int currentIndex = 0;
  int itemCount = 4;

  List<String> images=[
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: widget.size.width,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
           itemBuilder: (context,index,pageIndex){
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    images[index]
                    ),fit: BoxFit.cover),
              ),
            );
           }, options: CarouselOptions(
            onPageChanged: (index,reason){
              currentIndex = index;
              setState(() {
                
              });
            },
            height: 180,
            aspectRatio: 16/9,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            autoPlay: true
           )),
           SizedBox(height: 10,),
           DotsIndicator(
            position: currentIndex.toInt(),
            dotsCount: images.length,
           decorator: DotsDecorator(
            activeColor: Colors.green
           ),
           )
        ],
      )
    );
  }
}