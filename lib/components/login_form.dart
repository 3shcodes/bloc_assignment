
import 'package:bloc_assignment/models/user.dart';
import 'package:bloc_assignment/services/auth/bloc/auth_bloc.dart';
import 'package:bloc_assignment/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class LoginForm extends StatefulWidget {

  const LoginForm({ super.key });

  @override
  LoginState createState(){
    return LoginState();
  }

}



class LoginState extends State<LoginForm> {


  final _formKey = GlobalKey<FormState>();
  var _userName = '';
  var _pass = '';
  final client = Client();

  @override
  Widget build( BuildContext context ){

    void onLogin() async {

      _formKey.currentState!.save();
      dynamic resp = await AuthServices.loginFn(_userName, _pass);

      if ( resp['ok'] == true ) {


        User currUser = User.fromJson(resp['data']);

        context.read<AuthBloc>().add( Login(user: currUser));
        // authBloc.add( Login(user: currUser ));
      } else {

        final SnackBar errMsg = SnackBar(content: Text( resp['msg'].toString() ));
        ScaffoldMessenger.of(context).showSnackBar(errMsg);
        return;
      }

    }

    return Form(
      key: _formKey,
      child:
          Container( margin: const EdgeInsets.symmetric( horizontal: 12.5, vertical: 10.0 ),
          child: Column(
            children: <Widget>[

              TextFormField(
                validator: (value) {
                  if ( value!.isEmpty || value==""  ) {
                    return "Please enter username";
                  }
                  return null;
                },

                onSaved: ( val ) => _userName = val.toString(),

                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Who u?",
                  labelText: "Username",
                ),
              ),
              TextFormField(              

                validator: (value) {
                  if ( value!.isEmpty || value == "" ) {
                    return "Please enter valid password";
                  }
                  return null;
                },

                onSaved: ( val ) => _pass = val.toString(),

                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  labelText: "Password",
                ),
                obscureText: true,


              ),
              Container( 
                margin: const EdgeInsets.only(top:10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: onLogin, 
                    child: const Text("Login")
                  ),
                ),
              ),
            ],

      ),  ),
       
    );

  }
}