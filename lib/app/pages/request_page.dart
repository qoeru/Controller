import 'package:controler_app/app/bloc/cubit/camera_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechReview extends StatelessWidget {
  const TechReview({super.key});

  @override
  Widget build(BuildContext context) {
    var textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
    return SafeArea(
      child: Center(
        child: Container(
          width: 300,
          height: 490,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white30),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Техосмотр',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Статус: Новая заявка',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Необходимо прикрепить',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white30),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: CameraPlace(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Комментарий',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.1),
                    filled: true,
                    hintText: 'Комментарий',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                    focusedBorder: textFieldBorder,
                    enabledBorder: textFieldBorder,
                    disabledBorder: textFieldBorder,
                  ),
                  style: const TextStyle(color: Colors.white),
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(
                  height: 10,
                ),
                FilledButton.icon(
                  onPressed: () {},
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

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TechReview(),
    );
  }
}

class CameraPlace extends StatelessWidget {
  const CameraPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraButtonCubit, CameraButtonState>(
      builder: (context, state) {
        if (state is CameraButtonPhotoTaken) {
          return SmallImageGallery();
        }
        if (state is CameraButtonInitial) {
          return CameraButton();
        }
        return const Placeholder();
      },
    );
  }
}

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white30),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white.withOpacity(0.1)),
      child: OutlinedButton(
        onPressed: () {
          context.read<CameraButtonCubit>().shootImageFromCamera();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.photo,
              color: Colors.white,
            ),
            Text(
              'Загрузить фотографии',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallImageGallery extends StatelessWidget {
  const SmallImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}
