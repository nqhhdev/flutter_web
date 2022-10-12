import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<EmailSignInEvent>((event, emit) async {
      try {
        emit(SignInEmailLoadingState());
        await authRepository.signInWithEmailAndPassword(
          event.email,
          event.password,
        );
        emit(const SignInEmailSuccessState());
      } on FirebaseAuthException catch (signInEmailError) {
        emit(SignInEmailFailedState(signInEmailError.message ?? ""));
      } catch (error) {
        emit(SignInEmailFailedState(error.toString()));
      }
    });
  }
}
