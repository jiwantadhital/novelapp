import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelapp/routes/router.dart';
import 'package:novelapp/side_page/xtra.dart';

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
      height: 260,
      width: widget.size.width,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
           itemBuilder: (context,index,pageIndex){
            return Container(
              height: 500,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          images[index]
                          ),fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 105,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 3
                          )
                        ]
                      ),
                      child: GestureDetector(
                        onTap: (){
                       Get.to(() => Extras());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text("War Time",style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17
                            ),),
                            SizedBox(height: 5,),
                            Text("Last Updated at 1334",style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 14
                            ),),
                            SizedBox(height: 5,),
                            Container(
                              height: 33,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconsandText(icon: Icons.star,name: "4.5",),
                                  IconsandText(icon: Icons.chat,name: "13 COmments",),
                                  IconsandText(icon: Icons.favorite,name: "23",),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
           }, options: CarouselOptions(
            onPageChanged: (index,reason){
              currentIndex = index;
              setState(() {
                
              });
            },
            height: 210,
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

class IconsandText extends StatelessWidget {
IconData icon;
String name;
IconsandText({required this.icon,required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.green,),
        SizedBox(width: 3,),
        Text(name)
      ],
    );
  }
}