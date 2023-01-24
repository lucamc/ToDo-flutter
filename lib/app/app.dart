import 'package:flutter/material.dart';
import 'package:to_do_list/app/view/home/home_page.dart';
import 'package:to_do_list/app/view/splash/splash_page.dart';
import 'package:to_do_list/app/view/task_list/task_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //Theme Colors.
    const primaryColor = Color(0xFF3498DB);
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
