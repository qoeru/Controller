import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestPageOne());

  void moveToPageTwo() => emit(RequestPageTwo());

  void onLogout() => emit(RequestPageOne());
}
