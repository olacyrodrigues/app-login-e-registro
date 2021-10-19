import 'package:flutter/material.dart';
import 'package:login_registration/screens/login_screen.dart';
import 'package:login_registration/screens/sign_up_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olacy APP',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
