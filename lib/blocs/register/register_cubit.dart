import 'package:bloc/bloc.dart';
import 'package:devicial_mobile/repository/auth.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  Auth authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  void register(String username, String password, String email, String gender,
      String birthDate) async {
    emit(RegisterLoading());
    try {
      await authRepo.register(username, password, email, birthDate, gender);
      emit(RegisterSuccess());
      print('successssss');
    } on DioException catch (e) {
      // Use DioException instead of DioError
      print("Register error ${e.message}");
      emit(RegisterError());
    } catch (e) {
      print("Generic error $e");
      emit(RegisterError());
    }
  }
}
