import 'package:controler_app/app/widgets/loading.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingIndicator(),
    );
  }
}
