import 'package:bloc_assignment/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {

  const SignupForm({ super.key });

  @override
  SignupState createState(){
    return SignupState();
  }

}

class SignupState extends State<SignupForm> {

  final _formKey = GlobalKey<FormState>();
  var _userName = "";
  var _email = "";
  var _pwd = "";
  var _cnfPwd = "";

  @override
  Widget build( BuildContext context ){

    void signupFn() async{

      _formKey.currentState!.save();

      if ( _pwd != _cnfPwd ) {
        const errMsg = SnackBar(content: Text( 'Passwords do not match' ));
        ScaffoldMessenger.of(context).showSnackBar(errMsg);
        return;
      }

      dynamic resp = await AuthServices.signupFn(_userName, _email, _pwd);
      final SnackBar snackBarMsg;
      if ( resp['ok'] == true ) {
          snackBarMsg = const SnackBar(content: Text("Successfully signed up! Go to Login."));
      } else {
          snackBarMsg = SnackBar(content: Text(resp['msg']));
      }

      ScaffoldMessenger.of(context).showSnackBar(snackBarMsg);
      return;

    }

    return Form(
      key: _formKey,
      child: Column(

        children: <Widget>[
          Container( margin: const EdgeInsets.symmetric( horizontal: 12.5, vertical: 10.0 ) ),
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
              labelText: "Enter Username",
            ),

          ),
          TextFormField(

            validator: (value) {
              if ( value!.isEmpty || value==""  ) {
                return "Please enter email";
              }
              return null;
            },

            onSaved: ( val ) => _email = val.toString(),

            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: "Enter Email",
            ),

          ),

          TextFormField(              

            validator: (value) {
              if ( value!.isEmpty || value==""  ) {
                return "Please enter password";
              }
              return null;
            },

            onSaved: ( val ) => _pwd = val.toString(),

            decoration: const InputDecoration(
              icon: Icon(Icons.key),
              labelText: "Enter Password",),
              obscureText: true,

          ),

          TextFormField(              

            validator: (value) {
              if ( value!.isEmpty || value==""  ) {
                return "Please confirm your password";
              }
              return null;
            },

            onSaved: ( val ) => _cnfPwd = val.toString(),

            decoration: const InputDecoration(
              icon: Icon(Icons.key),
              labelText: "Confirm Password",
            ),
            obscureText: true,

          ),

          Container( 
            margin: const EdgeInsets.only(top:10),
            child: Center(
              child: ElevatedButton(
                onPressed: signupFn, 
                child: const Text("Sign Up")
              ),
            ),
          ),
        ],

      ),
    );

  }
}