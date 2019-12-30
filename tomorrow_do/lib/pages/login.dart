import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> _signIn() async {
    final AuthResult result = await _firebaseAuth.signInAnonymously();
    if (result.user.uid.length > 0 && result.user.uid != null) {
      Navigator.pushReplacementNamed(context, '/main');
    }
    return result.user;
  }

  Widget _showBody() {
    return Center(
      child: Form(
        child: _showLoginButton(),
      ),
    );
  }

  Widget _showIcon() {
    return Center(
      child: Image.asset(
        'assets/flutter.png',
        width: 100.0,
      ),
    );
  }

  Widget _showLoginButton() {
    return Center(
        child: RaisedButton(
          child: const Text('Start'),
          onPressed: () {
            return _signIn()
                .then((FirebaseUser user) => print(user))
                .catchError((e) => print(e));
          },
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showBody(),
    );
  }
}
