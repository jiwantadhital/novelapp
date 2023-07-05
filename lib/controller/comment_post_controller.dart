import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:novelapp/model/comment_model.dart';

class CommentController{

Future<bool> postComment({required comment})async{
var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/add/comments"),
body: jsonEncode({
  "product_id" : "1",
    "comments" : comment,
    "likes" : "5"
}),
headers: {
  "Content-Type" : "application/json"
}
);
if(response.statusCode==200){
  print(response.body);
return true;
}
else{
  print(response.reasonPhrase);
return false;
}

}

//get comment
Future<List<CommentsModel>> getComment()async{

var response =await http.get(Uri.parse("http://10.0.2.2:8000/api/add/comments"));
if(response.statusCode==200){
return List<CommentsModel>.from(jsonDecode(response.body.toString()).map((e)=>CommentsModel.fromJson(e)));

}
else{
  throw Exception("Error");
}


}


}