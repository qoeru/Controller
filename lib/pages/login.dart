import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      body: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneNumberString = RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Номер Телефона'),
          TextSpan(text: '*', style: TextStyle(color: Colors.red)),
        ],
      ),
    );

    var passwordString = RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Ваш пароль'),
          TextSpan(text: '*', style: TextStyle(color: Colors.red)),
        ],
      ),
    );

    var textFieldBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10)));

    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white30),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                phoneNumberString,
                TextField(
                  decoration: InputDecoration(
                    hintText: '+79999999999',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                    focusedBorder: textFieldBorder,
                    enabledBorder: textFieldBorder,
                    disabledBorder: textFieldBorder,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                passwordString,
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Ваш пароль',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                    focusedBorder: textFieldBorder,
                    enabledBorder: textFieldBorder,
                    disabledBorder: textFieldBorder,
                  ),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
