import 'package:bloc/bloc.dart';

// to save then pass the name to the result
class UserDataCubit extends Cubit<String> {
  UserDataCubit() : super('');

  void setUserName(String name) {
    emit(name);
  }
}