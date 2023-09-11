import 'package:flutter/material.dart';

import 'home_page/home_pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Convertor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Raleway"
      ),
      home: const HomePage(),
    );
  }
}
