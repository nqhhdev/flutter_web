import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/presentation/signup/ui/signup_screen.dart';

import '../../app/app.dart';
import '../../repositories/auth_repository.dart';
import 'bloc/signup_bloc.dart';

class SignUpScreenRoute {
  static Widget get route => BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
          getIt<AuthRepository>(),
        ),
        child: const SignUpEmailScreen(),
      );
}
