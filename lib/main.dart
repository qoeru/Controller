import 'package:controler_app/features/presentation/bloc/login_bloc.dart';
import 'package:controler_app/features/presentation/pages/loginPage.dart';
import 'package:controler_app/features/presentation/pages/home_page.dart';
import 'package:controler_app/features/presentation/pages/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Widget _defaultHome = AuthPage();

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
      // routes: {
      //   '/': (context) => AuthPage(),
      //   '/user': (context) => const RequestPage(),
      // },
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: HomePage(),
      ),
    );
  }
}
