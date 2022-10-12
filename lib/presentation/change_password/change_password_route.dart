

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/presentation/change_password/ui/change_password_screen.dart';

import '../../app/app.dart';
import '../../repositories/auth_repository.dart';
import 'bloc/change_password_bloc.dart';

class ChangePasswordScreenRoute {
  static Widget get route => BlocProvider<ChangePasswordBloc>(
        create: (context) => ChangePasswordBloc(getIt<AuthRepository>()),
        child: const ChangePasswordScreen(),
      );
}
