import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:controler_app/data/globals.dart' as globals;
import 'package:image_picker/image_picker.dart';
part 'camera_button_state.dart';

class CameraButtonCubit extends Cubit<CameraButtonState> {
  CameraButtonCubit() : super(CameraButtonInitial());

  void shootImageFromCamera() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      globals.currentPhotos == null
          ? globals.currentPhotos = [file]
          : globals.currentPhotos!.add(file);
      globals.currentPhotoCount = globals.currentPhotos!.length;
      emit(CameraButtonPhotoTaken());
      if (globals.currentPhotoCount == 4) {
        emit(CameraButtonMaxPhotoTaken());
      }
    } else {
      emit(CameraButtonInitial());
    }
  }

  void deleteTakenImage(int index) async {
    globals.currentPhotos!.removeAt(index);
    globals.currentPhotoCount = globals.currentPhotos!.length;
    if (globals.currentPhotoCount == 0) {
      emit(CameraButtonInitial());
    } else {
      emit(CameraButtonPhotoTaken());
    }
  }
}
