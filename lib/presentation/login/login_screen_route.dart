

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_web/presentation/login/ui/login_screen.dart';

import '../../app/app.dart';
import '../../repositories/auth_repository.dart';

class LoginScreenRoute {
  static Widget get route => BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          getIt<AuthRepository>(),
        ),
        child: const LoginScreen(),
      );
}
