import 'package:bloc_assignment/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



// class LoginForm extends StatefulWidget{

  
// }

class Login extends StatelessWidget{

  const Login( { super.key });

  @override
  Widget build( BuildContext context ){
    

    void moveToSignup(){
      context.go('/signup');
    }

    return Scaffold(


      body: 
        Column(

          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Row(
              children: [  
                Container( margin: const EdgeInsets.only(left: 15.0),),
                const Text("Login", style: TextStyle( fontSize: 30.0 )),
              ],
            ),
            const LoginForm(),
          ],
        ),

        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("New here?"),
            TextButton(onPressed: moveToSignup, child: const Text('Sign up')),
          ],
        )
      

    );
  }
}