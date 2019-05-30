import 'package:flutter/material.dart';
import 'package:flutter_json/util/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>  with ValidationMixin{
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitButton()
            ],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'you@example.com',
        labelText: 'Enter a email address',
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Enter Password',
        hintText: 'Enter Password',
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      ),
      validator: validatePassword,
      onSaved: (String value) {
        pass = value;
      },
    );
  }

  Widget submitButton() {
    return Container(
        height: 40.0,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.greenAccent,
          color: Colors.green,
          elevation: 7.0,
          child: GestureDetector(
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
//                print("You supplied $email and password:$pass");

                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text('You supplied $email and  $pass"')));
              }
            },
            child: Center(
              child: Text(
                'SUBMIT',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ),
        ));
  }
}
