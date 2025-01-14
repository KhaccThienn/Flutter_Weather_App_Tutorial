import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/home/home_screen.dart';
import 'package:weather_app/utils/Binding/HomeBinding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const HomeScreen(), binding: HomeBinding())
      ],
    );
  }
}
