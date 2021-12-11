import 'package:flutter/material.dart';
import 'package:my_app/screens/login.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mY APP',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: LoginScreen(),
    );
  }
}

