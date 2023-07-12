import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:novelapp/side_page/practice_controller.dart';
import 'package:provider/provider.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Consumer<PracticeController>(builder: (context,value,child){
              return  Text(value.number.toString());
             }),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                context.read<PracticeController>().adding();
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}