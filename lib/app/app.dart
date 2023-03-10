import 'package:flutter/material.dart';
import 'package:to_do_list/app/pages/home/home_page.dart';
import 'package:to_do_list/app/pages/splash/splash_page.dart';
import 'package:to_do_list/app/pages/taskList/task_list_page.dart';

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
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                54,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )
            ),
          )),
      home: SplashPage(),
    );
  }
}
