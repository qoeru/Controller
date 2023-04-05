import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
part 'camera_button_state.dart';

class CameraButtonCubit extends Cubit<CameraButtonState> {
  CameraButtonCubit() : super(CameraButtonInitial());

  Future<void> shootImageFromCamera() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      emit(CameraButtonPhotoTaken(file.path));
    }
  }
}
