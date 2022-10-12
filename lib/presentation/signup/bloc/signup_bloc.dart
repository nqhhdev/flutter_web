import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/auth_repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;

  SignUpBloc(
    this.authRepository,
  ) : super(SignUpInitState()) {
    on<EmailSignUpEvent>((event, emit) async {
      try {
        emit(SignUpLoadingState());
        await authRepository.createUserWithEmailAndPassword(
          event.email,
          event.password,
        );
        final user = FirebaseAuth.instance.currentUser;
        user?.updateDisplayName(event.name);
        emit(SignUpSuccessState());
      } on FirebaseAuthException catch (signInEmailError) {
        emit(SignUpFailedState(signInEmailError.message ?? ""));
      } catch (error) {
        emit(SignUpFailedState(error.toString()));
      }
    });
  }
}
