import 'package:controler_app/app/bloc/cubit/camera_button_cubit.dart';
import 'package:controler_app/app/bloc/cubit/request_cubit.dart';
import 'package:controler_app/app/pages/auth_page.dart';
import 'package:controler_app/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:controler_app/data/globals.dart' as globals;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.lightBlack,
        backgroundColor: AppColors.black,
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('isLogged', false);

              context.read<RequestCubit>().onLogout();
              context.read<CameraButtonCubit>().onLogout();

              Navigator.pushReplacement(
                  context,
                  (MaterialPageRoute(
                      builder: (BuildContext context) => AuthPage())));
            },
            icon: Icon(Icons.exit_to_app_outlined),
            splashRadius: 20,
          ),
        ],
      ),
      body: const SafeArea(
        child: ReviewContainer(),
      ),
    );
  }
}

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        // height: 490,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white30),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
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
              ExpansionTile(
                title: const Text(
                  'Необходимо прикрепить:',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                iconColor: Colors.white,
                backgroundColor: AppColors.darkRed,
                collapsedBackgroundColor: AppColors.darkRed,
                textColor: Colors.white,
                collapsedTextColor: Colors.white,
                collapsedIconColor: Colors.white,

                shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.darkRed),
                  borderRadius: BorderRadius.circular(10),
                ),
                collapsedShape: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.darkRed),
                    borderRadius: BorderRadius.circular(10)),
                // shape: Bo,
                children: const [
                  ListTile(
                    title: Text(
                      '',
                      // textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const RequestForms(),
              const SizedBox(
                height: 20,
              ),
              const LowerButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class LowerButton extends StatelessWidget {
  const LowerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestCubit, RequestState>(
      builder: (context, RequestState requestState) {
        return BlocBuilder<CameraButtonCubit, CameraButtonState>(
          builder: (context, CameraButtonState cameraState) {
            if (cameraState is CameraButtonPhotoTaken) {
              return FilledButton.icon(
                  onPressed: () => {
                        context.read<CameraButtonCubit>().shootImageFromCamera()
                      },
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.black,
                  ),
                  label: const Text(
                    'Добавить фото',
                    style: TextStyle(
                        color: AppColors.black, fontWeight: FontWeight.w700),
                  ),
                  style: FilledButton.styleFrom(backgroundColor: Colors.white));
            }
            if (cameraState is CameraButtonInitial) {
              return const SizedBox(
                height: 0,
              );
            }
            if (requestState is RequestPageTwo) {
              return FilledButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                label: const Text(
                  'Отправить',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style:
                    FilledButton.styleFrom(backgroundColor: AppColors.orange),
              );
            }

            return FilledButton.icon(
              onPressed: () {
                context.read<RequestCubit>().moveToPageTwo();
              },
              icon: const Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
              label: const Text(
                'Далее',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: FilledButton.styleFrom(backgroundColor: AppColors.orange),
            );
          },
        );
      },
    );
  }
}

class RequestForms extends StatelessWidget {
  const RequestForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestCubit, RequestState>(
      builder: (context, state) {
        if (state is RequestPageOne) {
          return Container(
            // height: 100,
            // width: 300,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white30),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: const CameraPlace(),
          );
        }
        return const CommmentaryField();
      },
    );
  }
}

class CommmentaryField extends StatelessWidget {
  const CommmentaryField({super.key});

  @override
  Widget build(BuildContext context) {
    var textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Комментарий',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
      ],
    );
  }
}

class CameraPlace extends StatelessWidget {
  const CameraPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraButtonCubit, CameraButtonState>(
      builder: (context, state) {
        if (state is CameraButtonPhotoTaken ||
            state is CameraButtonMaxPhotoTaken) {
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
      height: 90,
      // width: 100,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white30),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white.withOpacity(0.1)),
      child: OutlinedButton(
        onPressed: () =>
            {context.read<CameraButtonCubit>().shootImageFromCamera()},
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
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scrollbar(
          // trackVisibility: true,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: globals.currentPhotoCount,
              itemBuilder: ((context, index) {
                return PhotoBlock(
                  index: index,
                );
              })),
        ),
      ),
    );
  }
}

class PhotoBlock extends StatelessWidget {
  int index;

  PhotoBlock({required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white30),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              image: DecorationImage(
                  image: Image.file(
                    File(
                      globals.currentPhotos![index].path,
                    ),
                  ).image,
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  context.read<CameraButtonCubit>().deleteTakenImage(index);
                },
                icon: const Icon(Icons.close, color: Colors.white),
                splashColor: Colors.white.withOpacity(0),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

// class closeButton extends StatelessWidget {
//   const closeButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {context.read<CameraButtonCubit>().deleteTakenImage(index)},
//       icon: const Icon(Icons.close, color: Colors.white),
//       splashColor: Colors.white.withOpacity(0),
//     );
//   }
// }
