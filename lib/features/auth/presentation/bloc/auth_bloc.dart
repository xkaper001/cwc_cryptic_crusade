import 'package:cwc_cryptic_crusade/features/auth/domain/usecase/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  AuthBloc(this.login) : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      final res = await login(LoginParams(
        teamId: event.teamId,
        playKey: event.playKey,
      ));
      res.fold(
        (l) => emit(AuthFailure(l.message)),
        (r) => emit(AuthSuccess(event.teamId)),
      );
    });
  }
}
