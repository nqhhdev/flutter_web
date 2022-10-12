part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
  
  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ShowLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordFailedState extends ChangePasswordState {
  final String error;

  const ChangePasswordFailedState(this.error);

  @override
  List<Object> get props => [error];
}