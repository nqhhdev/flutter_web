part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class SendingForgotPasswordState extends ForgotPasswordState {}

class EmailForgotPasswordSuccessState extends ForgotPasswordState {}

class EmailForgotPasswordFailedState extends ForgotPasswordState {
  final String error;

  const EmailForgotPasswordFailedState(this.error);

  @override
  List<Object> get props => [error];
}
