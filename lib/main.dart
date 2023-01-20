import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app.dart';

void main() {

  //Quitar barra de Android que esta por defecto. import flutter/service
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
  ));

  runApp(const MyApp());
}

