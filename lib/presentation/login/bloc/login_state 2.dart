part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}



class SignInEmailLoadingState extends LoginState {}

class SignInEmailSuccessState extends LoginState {

  const SignInEmailSuccessState();
}

class SignInEmailFailedState extends LoginState {
  final String error;

  const SignInEmailFailedState(this.error);

  @override
  List<Object?> get props => [error];
}