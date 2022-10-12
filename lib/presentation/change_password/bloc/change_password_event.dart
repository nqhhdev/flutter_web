part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object?> get props => [];
}

class SendChangePasswordEvent extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;

  const SendChangePasswordEvent(this.currentPassword, this.newPassword);

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
