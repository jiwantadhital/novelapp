import 'package:flutter/material.dart';
import 'package:novelapp/detail_page/popular_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopularItems extends StatefulWidget {
  const PopularItems({
    super.key,
  });

  @override
  State<PopularItems> createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {
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
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        return GestureDetector(
          onTap: ()async{
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('manish', index.toString());
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return PopularDetails();
            }));
          },
          child: Container(
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
                Text(value,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),)
              ],
            ),
          ),
        );
      }),
    );
  }
}