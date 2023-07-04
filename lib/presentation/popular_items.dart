
import 'package:flutter/material.dart';
import 'package:novelapp/controller/popular_controller.dart';
import 'package:novelapp/detail_page/popular_details.dart';
import 'package:novelapp/model/popular_model.dart';


class PopularItems extends StatefulWidget {
  const PopularItems({
    super.key,
  });

  @override
  State<PopularItems> createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {


PopularController popularController = PopularController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child:FutureBuilder<List<PopularModel>>(
        future: popularController.getPopularItem(),
        builder: (context,snapshot){
         if(snapshot.hasData){
          return  ListView.builder(
            itemCount: snapshot.data!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        return GestureDetector(
          onTap: ()async{
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return PopularDetail(popularData: snapshot.data![index],);
            }));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 200,
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
                  height: 130,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                    ),
                    image: DecorationImage(image: NetworkImage(snapshot.data![index].image.toString()),
                    fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Text(snapshot.data![index].title.toString(),style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),)
              ],
            ),
          ),
        );
      });
         }
         return Center(child: CircularProgressIndicator());
      }),
    );
  }
}