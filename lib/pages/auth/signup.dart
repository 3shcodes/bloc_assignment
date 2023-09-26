import 'package:bloc_assignment/components/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatelessWidget{

  const Signup( { super.key });

  @override
  Widget build( BuildContext context ){

    void moveToLogin(){
      context.go('/login');
    }

    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            children: [
              Container( margin: const EdgeInsets.only(left: 15.0),),
              const Text("Signup", style: TextStyle( fontSize: 30.0 )),
            ],
          ),
          const SignupForm(),
        ]
      ),

      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Been here?"),
          TextButton(onPressed: moveToLogin, child: const Text("Login"))
        ]
      ),
    );
  }
}