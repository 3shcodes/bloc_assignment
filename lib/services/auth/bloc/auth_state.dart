part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class LoggedIn extends AuthState {

  final User user;
  const LoggedIn(this.user);

  @override
  List<Object> get props => [ user ];

}

class LoggedOut extends AuthState {}
