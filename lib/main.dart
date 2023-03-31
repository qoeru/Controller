import 'package:controler_app/models/apiService.dart';
import 'package:controler_app/pages/login.dart';
import 'package:controler_app/pages/request.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget _defaultHome = const AuthPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Контролёр',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      routes: {
        '/': (context) => const AuthPage(),
        '/user': (context) => const RequestPage(),
      },
    );
  }
}
