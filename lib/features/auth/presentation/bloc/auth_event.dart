part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginEvent extends AuthEvent {
  final String teamId;
  final String playKey;
  AuthLoginEvent(this.teamId, this.playKey);
}