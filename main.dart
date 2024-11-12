import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:scrren4/pie_screen.dart';
import 'package:scrren4/progressbar_screens.dart';
import 'package:scrren4/theme_and_components/theme_colors.dart';

import 'add_members.dart';
import 'formfeild_page.dart';
// Adjust the path if necessary



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',



      theme: darktheme,
      home:   Progressbar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {





  @override
  Widget build(BuildContext context) {

    return Progressbar();
  }
}
