import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Shared extends StatefulWidget {
  const Shared({super.key});

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  var textController = TextEditingController();
  String name = "";

savedData()async{
 final SharedPreferences prefs = await SharedPreferences.getInstance();
 name =  prefs.getString("text")??"";
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
    return  Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Center(
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              ElevatedButton(onPressed: ()async{
                name = textController.text;
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("text",textController.text);
                setState(() {
                  
                });
              }, child: Text("Press Here")),
              SizedBox(height: 20,),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}