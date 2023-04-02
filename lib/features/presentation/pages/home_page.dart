import 'package:controler_app/features/presentation/bloc/login_bloc.dart';
import 'package:controler_app/features/presentation/pages/loginPage.dart';
import 'package:controler_app/features/presentation/pages/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              if (state is LoginAuthenticated)
                const MaterialPage(child: RequestPage()),
              if (state is LoginUnauthenticated || state is LoginUninitialized)
                MaterialPage(child: AuthPage()),
              if (state is LoginLoading)
                const MaterialPage(
                  child: Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
