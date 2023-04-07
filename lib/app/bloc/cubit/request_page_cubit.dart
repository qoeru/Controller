import 'package:bloc/bloc.dart';

part 'request_page_state.dart';

class RequestPageCubit extends Cubit<RequestPageState> {
  RequestPageCubit() : super(RequestPageOne());

  void moveToPageTwo() => emit(RequestPageTwo());

  void onLogout() => emit(RequestPageOne());
}
