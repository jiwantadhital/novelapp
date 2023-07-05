// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:novelapp/controller/comment_post_controller.dart';

class PopularDetail extends StatefulWidget {
var popularData;
PopularDetail({required this.popularData});

  @override
  State<PopularDetail> createState() => _PopularDetailState();
}

class _PopularDetailState extends State<PopularDetail> {
  bool loading = false;
var commentController = TextEditingController();
int value = 0;

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              if(value==0){
              
                              }
                              else{
                                value=0;
                               
                              }
                               setState(() {
                                  
                                });
              
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 50,
                              width: size.width*0.45,
                              decoration: BoxDecoration(
                                color:value==0?Colors.blue: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: CustomText(name: "Description", color: Colors.white, size: 19, weight: FontWeight.w600)),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(value==0){
                                value=1;
              
                              }
                              else{
              
                              }
                              setState(() {
                                
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 50,
                              width: size.width*0.45,
                              decoration: BoxDecoration(
                                color:value==0? Colors.green:Colors.blue,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: CustomText(name: "Comments", color: Colors.white, size: 19, weight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                   value==0? Description( widget: widget):
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 200,
                    width: size.width,
                    child: Column(
                      children: [
                        TextField(
                          controller: commentController,
                          maxLines: 4,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Comments",
                            border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                       loading==false? ElevatedButton(
                          onPressed: ()async{
                           setState(() {
                            loading=true;
                            setState(() {
                              
                            });
                              CommentController().postComment(comment: commentController.text).then((value)  {
                                loading=false;
                                setState(() {
                                 commentController.clear();
                             });
                              });
              
                           });
              
                        }, child: Text("Submit")):CircularProgressIndicator()
                      ],
                    ),     
              
                  ),
                  SizedBox(height: 10,),
                value==1?  FutureBuilder(
                    future: CommentController().getComment(),
                    builder: (context,snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                    padding: EdgeInsets.all(10),
                    width: size.width,
                   decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                   ),
                   child: Text(snapshot.data![index].comments.toString()),
                  );
                  });
                    }
                    return CircularProgressIndicator.adaptive();
                  }):Container()
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}


//description
class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.widget,
  });

  final PopularDetail widget;

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         CustomText(name: widget.popularData.title,size: 20,weight: FontWeight.w600,color: Colors.black,),
     SizedBox(height: 15,),
     CustomText(name: widget.popularData.description, color: Colors.black, size: 15, weight: FontWeight.w400)
       ],
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
