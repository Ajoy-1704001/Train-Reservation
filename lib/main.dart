import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainapp/screens/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Railway Reservation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.yellow,
      ),
      home: const Navigation(),
    );
  }
}
