// ignore_for_file: prefer_const_constructors, unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sindhu/current.dart';
import 'package:sindhu/tools/colors.dart';
import 'package:sindhu/widgets/loading.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      routes: {
        '': (context) => LoadingScreen()
      },
      initialRoute: '',
      title: "Sindhu",
      debugShowCheckedModeBanner: false,
      home: CurrentPage(),
    )
  );
}






