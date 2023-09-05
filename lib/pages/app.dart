import 'package:converter/pages/home_pages.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Money Convertier",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Raleway",
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
