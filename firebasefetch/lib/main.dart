import 'package:firebase_core/firebase_core.dart';
import 'package:firebasefetch/details.dart';
import 'package:firebasefetch/home.dart';
import 'package:firebasefetch/popular.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Details(),
    );
  }
}
