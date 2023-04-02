// import 'package:controler_app/features/presentation/bloc/login_bloc.dart';
// import 'package:controler_app/features/presentation/pages/loginPage.dart';
// import 'package:controler_app/features/presentation/pages/loading_page.dart';
// import 'package:controler_app/features/presentation/pages/request.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//       builder: (context, state) {
//         if (state is LoginUninitialized || state is LoginUnauthenticated) {
//           BlocProvider.of<LoginBloc>(context)
//                       .add();
//         } else if (state is LoginAuthenticated) {
//           return const RequestPage();
//         }
//         return const LoadingPage();
//       },
//     );
//   }
// }
