import 'dart:convert';

import 'package:http/http.dart' as http;

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

}