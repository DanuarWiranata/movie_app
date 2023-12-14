import 'package:flutter/material.dart';
import 'package:tix_id/screens/homeScreen.dart';
import 'package:tix_id/colors.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutfix',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: colors.scaffoldBgColor,
        useMaterial3: true,
      ),
      home: homeScreen(),
    );
  }
}