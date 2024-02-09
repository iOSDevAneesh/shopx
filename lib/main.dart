import 'package:flutter/material.dart';
import 'package:shopx/view/home_page.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(0xFFFFFFFF, <int, Color>{}),
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),

      home:  HomePage(),
    );
  }
}


