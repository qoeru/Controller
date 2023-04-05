import 'package:controler_app/app/bloc/login_bloc.dart';
import 'package:controler_app/app/pages/request_page.dart';
import 'package:controler_app/config/theme/theme.dart';
import 'package:controler_app/data_sources/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:controler_app/domain/models/token_obtain_pair.dart';

class AuthPage extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var phoneNumberString = RichText(
      text: const TextSpan(
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Номер Телефона'),
          TextSpan(text: '*', style: TextStyle(color: AppColors.red)),
        ],
      ),
    );

    var passwordString = RichText(
      text: const TextSpan(
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Ваш пароль'),
          TextSpan(text: '*', style: TextStyle(color: AppColors.red)),
        ],
      ),
    );

    var textFieldBorder = OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
        borderRadius: const BorderRadius.all(Radius.circular(10)));

    AppUtil appUtil = AppUtil();

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 450,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: AppColors.white.withOpacity(0.2)),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        color: AppColors.darkRed,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.question_mark_rounded,
                            color: AppColors.pink,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            'Обратитесь в диспетчерскую, чтобы получить пароль.',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  phoneNumberString,
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white.withOpacity(0.05),
                      hintText: '+79999999999',
                      hintStyle:
                          TextStyle(color: AppColors.white.withOpacity(0.5)),
                      focusedBorder: textFieldBorder,
                      enabledBorder: textFieldBorder,
                      disabledBorder: textFieldBorder,
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                  ),
                  passwordString,
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white.withOpacity(0.05),
                      hintText: 'Ваш пароль',
                      hintStyle:
                          TextStyle(color: AppColors.white.withOpacity(0.5)),
                      focusedBorder: textFieldBorder,
                      enabledBorder: textFieldBorder,
                      disabledBorder: textFieldBorder,
                    ),
                    style: const TextStyle(color: AppColors.white),
                    obscureText: true,
                  ),
                  Builder(builder: (context) {
                    return FilledButton.icon(
                      onPressed: () {
                        String currentPassword =
                            _passwordController.text.toString();
                        String currentPhone = _phoneController.text.toString();
                        TokenObtainPair currentTokenPair = TokenObtainPair(
                            phone: currentPhone, password: currentPassword);
                        appUtil.login(currentTokenPair);
                        Navigator.of(context).push((MaterialPageRoute(
                            builder: (BuildContext context) => RequestPage())));
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Отправить',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: FilledButton.styleFrom(
                          backgroundColor: AppColors.orange),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
