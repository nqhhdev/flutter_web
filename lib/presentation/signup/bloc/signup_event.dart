import 'package:equatable/equatable.dart';

class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailSignUpEvent extends SignUpEvent {
  final String email;
  final String password;
  final String name;

  EmailSignUpEvent(
    this.email,
    this.password,
    this.name,
  );

  @override
  List<Object?> get props => [
        email,
        password,
        name,
      ];
}
