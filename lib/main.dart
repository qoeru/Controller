import 'app/bloc/login_bloc.dart';
import 'app/pages/auth_page.dart';
import 'app/pages/request_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LoginBloc? login;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Контролёр',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/auth': (context) => AuthPage(),
      //   '/user': (context) => const RequestPage(),
      // },
      home: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          login ??= context.read<LoginBloc>();
          if (state is LoginAuthenticated) return RequestPage();
          return AuthPage();
        },
      ),
    );
  }
}
