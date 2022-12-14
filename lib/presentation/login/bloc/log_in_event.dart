part of 'log_in_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailSignInEvent extends LoginEvent {
  final String email;
  final String password;

  const EmailSignInEvent(this.email, this.password);

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}