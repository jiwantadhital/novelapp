import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novelapp/model/popular_model.dart';
import 'package:http/http.dart' as http;

// class PopularController{

// //getpopular api
// Future<List<PopularModel>> getPopularItem()async{

// var response =await http.get(Uri.parse("https://mocki.io/v1/e95a0e81-9fbe-477f-b952-7e96c3322400"));
// if(response.statusCode==200){
// return List<PopularModel>.from(jsonDecode(response.body.toString()).map((e)=>PopularModel.fromJson(e)));

// }
// else{
//   throw Exception("Error");
// }


// }

// }

class PopularController extends GetxController{
  List<PopularModel> popularItem= [];

//getpopular api
Future<List<PopularModel>> getPopularItem()async{
var response =await http.get(Uri.parse("https://mocki.io/v1/e95a0e81-9fbe-477f-b952-7e96c3322400"));
if(response.statusCode==200){
  popularItem.clear();
  update();
  popularItem.addAll(List<PopularModel>.from(jsonDecode(response.body.toString()).map((e)=>PopularModel.fromJson(e))));
  update();
return List<PopularModel>.from(jsonDecode(response.body.toString()).map((e)=>PopularModel.fromJson(e)));
}
else{
  throw Exception("Error");
}


}

}