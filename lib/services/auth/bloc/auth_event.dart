part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}


class Login extends AuthEvent {

  final User user;
  const Login({ required this.user });
  
  @override
  List<Object> get props => [ user ];

}



class Logout extends AuthEvent {}
class CheckAuth extends AuthEvent {}
