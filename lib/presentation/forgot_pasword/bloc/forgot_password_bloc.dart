import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../repositories/auth_repository.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository authRepository;

  ForgotPasswordBloc(this.authRepository)
      : super(ForgotPasswordInitialState()) {
    on<SendPasswordResetEmailEvent>((event, emit) async {
      try {
        emit(SendingForgotPasswordState());
        await authRepository.sendPasswordResetEmail(event.email);
        emit(EmailForgotPasswordSuccessState());
      } on FirebaseAuthException catch (signInEmailError) {
          emit(EmailForgotPasswordFailedState(signInEmailError.message ?? ""));
      } catch (e) {
        emit(EmailForgotPasswordFailedState(e.toString()));
      }
    });
  }
}
