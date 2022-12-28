import 'package:flutter/material.dart';

import 'package:flutter_application_1/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       scaffoldBackgroundColor: const Color(0xFF111a2e),
       hintColor:const Color.fromARGB(255, 76, 92, 134) ,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, elevation: 0),
        textTheme: const TextTheme(
            headline1: TextStyle(
                color: Color(0xFF111a2e), fontWeight: FontWeight.bold, fontSize: 18),
            headline2: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
            headline3: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            headline4: TextStyle(color: Color.fromARGB(255, 76, 92, 134), fontSize: 18)),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
