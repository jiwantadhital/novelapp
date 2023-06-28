import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared extends StatefulWidget {
  const Shared({super.key});

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
String name = "Data";
var textController = TextEditingController();

savedData()async{
 final SharedPreferences saved = await SharedPreferences.getInstance();
 name = saved.getString("myname").toString();
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
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              final SharedPreferences saved = await SharedPreferences.getInstance();
              name = textController.text;
            await saved.setString('myname', name);
              setState(() {
                
              });
            }, child: Text("Click Me")),
            SizedBox(height: 20,),
            Text(name)
          ],
        ),
      ),
    );
  }
}