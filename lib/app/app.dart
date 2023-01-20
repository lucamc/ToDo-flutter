import 'package:flutter/material.dart';
import 'package:to_do_list/app/view/home.dart';
import 'package:to_do_list/app/view/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //Theme Colors.
    const primaryColor = Color(0xFF40B7AD);
    const textColor = Color(0xFF4A4A4A);
    const backgroundColor = Color(0xFFF5F5F5);

    return MaterialApp(
      title: 'To-do-list',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        //Implement primary color.
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: backgroundColor,

        //Implements text color.
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              bodyColor: textColor,
              displayColor: textColor,
            ),
      ),
      home: SplashPage(),
    );
  }
}
