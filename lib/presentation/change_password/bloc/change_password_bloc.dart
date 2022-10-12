import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/auth_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
    final AuthRepository authRepository;
  ChangePasswordBloc(this.authRepository) : super(ChangePasswordInitial()) {
    on<SendChangePasswordEvent>((event, emit) async {
      try {
        emit(ShowLoadingState());
        await authRepository.changePassword(event.currentPassword, event.newPassword);
        emit(ChangePasswordSuccessState());
      } on FirebaseAuthException catch (signInEmailError) {
          emit(ChangePasswordFailedState(signInEmailError.message ?? ""));
      } catch (e) {
        emit(ChangePasswordFailedState(e.toString()));
      }
    });
  }
}
