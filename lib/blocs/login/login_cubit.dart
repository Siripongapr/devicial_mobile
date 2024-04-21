import 'package:bloc/bloc.dart';
import 'package:devicial_mobile/models/users.dart';
import 'package:devicial_mobile/repository/auth.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  Auth authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  void login(String username, String password) async {
    emit(LoginLoading());
    try {
      await authRepo.login(username, password);
      final info = await authRepo.getInfo();
      emit(LoginSuccess(user: info));
    } catch (e) {
      emit(LoginError());
    }
  }

  void resetState() {
    emit(LoginInitial());
  }
}
