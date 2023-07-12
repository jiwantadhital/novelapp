import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelapp/bottom_navBar/bottom_nav.dart';
import 'package:novelapp/controller/popular_controller.dart';
import 'package:novelapp/presentation/home_page.dart';
import 'package:novelapp/routes/router.dart';
import 'package:novelapp/side_page/api_practice.dart';
import 'package:novelapp/side_page/practice.dart';
import 'package:novelapp/side_page/practice_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

Get.lazyPut(()=>PopularController());

    return GetBuilder<PopularController>(builder: (_){
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context){
            return PracticeController();
          })
        ],
        child: GetMaterialApp(
          onGenerateRoute: RouteNav.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home: Practice(),
          ),
      );
    });
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}