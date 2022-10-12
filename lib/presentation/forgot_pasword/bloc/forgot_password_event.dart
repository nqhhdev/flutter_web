part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class SendPasswordResetEmailEvent extends ForgotPasswordEvent {
  final String email;

  const SendPasswordResetEmailEvent(this.email);

  @override
  List<Object?> get props => [email];
}
