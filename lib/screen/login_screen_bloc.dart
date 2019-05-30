import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class BlocLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    // TODO: implement build
    return Container(
        margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(bloc)
          ],
        ));
  }

  Widget emailField(bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'you@example.com',
              labelText: 'Enter a email address',
              errorText: snapshot.error,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
            ),
          );
        });
  }

  Widget passwordField(bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Enter Password',
              hintText: 'Enter Password',
              errorText: snapshot.error,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
            ),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          color: Colors.green,
          elevation: 7.0,
          child: Text(
            'SUBMIT',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
          onPressed: snapshot.hasData ? ()
          { Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('You supplied ${bloc.email}')));
          }
              : null ,
        );
      },
    );
  }
}
