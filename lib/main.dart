import 'package:controler_app/app/bloc/cubit/camera_button_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/bloc/login_bloc.dart';
import 'app/pages/auth_page.dart';
import 'app/pages/request_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isLoggedIn = prefs.getBool('isLogged');

  runApp(MultiBlocProvider(
    providers: [
      // BlocProvider<LoginBloc>(
      //   create: (context) => LoginBloc(),
      // ),
      BlocProvider(
        create: (context) => CameraButtonCubit(),
      ),
    ],
    child: MyApp(isLoggedIn: isLoggedIn),
  ));
}

class MyApp extends StatelessWidget {
  bool? isLoggedIn;

  MyApp({required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Контролёр',
        theme: DarkTheme(),
        home: isLoggedIn == true ? RequestPage() : AuthPage());
  }
}
