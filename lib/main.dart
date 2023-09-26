import 'package:bloc_assignment/services/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_assignment/router/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 

    return BlocProvider(
      create: (context) => AuthBloc() ..add( CheckAuth() ),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
        
          if ( state is LoggedIn ) {
            router.go('/insights');
          } else if ( state is LoggedOut ) {
            router.go('/login');
          }
        },
        child: MaterialApp.router(
            theme: ThemeData( primaryColor: Colors.teal ),
            routerConfig: router,
        ),
      ),
    );

  }
}
