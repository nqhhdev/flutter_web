import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/presentation/forgot_pasword/ui/forgot_pasword_screen.dart';

import '../../app/app.dart';
import '../../repositories/auth_repository.dart';
import 'bloc/forgot_password_bloc.dart';

class ForgotPasswordScreenRoute {
  static Widget get route => BlocProvider<ForgotPasswordBloc>(
        create: (context) => ForgotPasswordBloc(getIt<AuthRepository>()),
        child: const ForgotPasswordScreen(),
      );
}
