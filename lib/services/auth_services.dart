import 'dart:convert';

import 'package:http/http.dart';

class AuthServices {

  static Future<dynamic> loginFn( String userName, String pwd ) async {

      final client = Client();

      var resp = await client.post( 
          Uri.parse( "http://192.168.1.101:1234/auth/login"), 
          headers: {
            "content-type": "application/json; charset=utf-8"
          },
          body: jsonEncode({
            "userName" : userName,
            "password" : pwd
          })
        ); 

        return jsonDecode( resp.body );
    }

    static Future<dynamic> signupFn( String userName, String email, String pwd ) async {

        final client = Client();

        var resp = await client.post(
            Uri.parse("http://192.168.1.101:1234/auth/signup"),
            headers: {
              "content-type" : "application/json; charset=utf-8"
            },
            body: jsonEncode({
                "userName": userName,
                "email": email,
                "password": pwd
            })
        );

        return jsonDecode(resp.body);
    }
  }
