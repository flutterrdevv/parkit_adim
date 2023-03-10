import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:park_admin/screens/bluetooth/bluetooth_screen.dart';

import 'package:park_admin/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Text Recognition';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const HomeScreen());
}
