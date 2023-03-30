import 'package:controler_app/pages/request.dart';
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

    var textFieldBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10)));

    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 300,
          height: 450,
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
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.question_mark_rounded,
                            color: Colors.pink.shade100,
                          )),
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Обратитесь в диспетчерскую, чтобы получить пароль.',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
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
                  keyboardType: TextInputType.phone,
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
                  obscureText: true,
                ),
                FilledButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestPage()),
                    );
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.blueGrey.shade700,
                  ),
                  label: Text(
                    'Отправить',
                    style: TextStyle(
                        color: Colors.blueGrey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  style: FilledButton.styleFrom(backgroundColor: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
