import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Satisfy',
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'email'),
                      validator: (input) => (input.contains('@')
                          ? null
                          : 'Please enter a valid email address'),
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'password'),
                      validator: (input) => input.length < 6
                          ? 'please enter a longer password'
                          : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                    onPressed: _submit,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, SignUpScreen.id),
                      child: Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
