import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_assignment/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoggedOut()) {

    on<Login>((event, emit) async {

        if ( state is LoggedOut ) {
          
            SharedPreferences pref = await SharedPreferences.getInstance();
            
            final userString = json.encode(event.user).toString();
            pref.setString('user', userString);

            emit( LoggedIn(event.user));
          
        }

    });

    on<Logout>((event, emit) async{

        if ( state is LoggedIn ) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.remove('user');
        }

        emit(LoggedOut());

    });

    on<CheckAuth>((event, emit) async {

        SharedPreferences pref = await SharedPreferences.getInstance();
        String? user = pref.getString('user');

        if ( user != null ) {

            User currUser = User.fromJson(json.decode(user)) ;
            emit( LoggedIn(currUser));

        } else {
            emit(LoggedOut());
        }

    });

  }
}
