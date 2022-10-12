import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpFailedState extends SignUpState {
  final String error;

  SignUpFailedState(this.error);

  @override
  List<Object?> get props => [error];
}
