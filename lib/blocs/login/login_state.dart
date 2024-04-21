part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

sealed class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  UserModel user;
  LoginSuccess({required this.user});
}

final class LoginError extends LoginState {}

final class LogoutInitial extends LogOutState {}

final class LogoutSuccess extends LogOutState {}

final class LogoutLoading extends LogOutState {}

final class LogOutError extends LogOutState {}
