import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pr123/Logowanie/RejestracjaWidok.dart';
import 'Logowanie/LogowanieWidok.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';




void main()


{
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: RejestracjaWidok(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
