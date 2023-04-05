part of 'camera_button_cubit.dart';

@immutable
abstract class CameraButtonState {}

class CameraButtonInitial extends CameraButtonState {}

class CameraButtonPhotoTaken extends CameraButtonState {
  CameraButtonPhotoTaken(String imagePath);
}
