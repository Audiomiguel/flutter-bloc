import 'package:bloc/bloc.dart';

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super('no-username') {
    print('UsernameCubit initializing');
  }

  void setUsername(String username) {
    emit(username);
  }
}
