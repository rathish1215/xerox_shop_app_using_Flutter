import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Duration get loadingTime => const Duration(milliseconds: 2000);

  Future<String?> _authUser(LoginData data) async {
    await Future.delayed(loadingTime);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('savedEmail', data.name);
    return null;
  }

  Future<String?> _recoverPassword(String data) async {
    return Future.delayed(loadingTime).then((value) => null);
  }

  Future<String?> _signupUser(SignupData data) async {
    return Future.delayed(loadingTime).then((value) => null);
  }

  String? _emailValidator(String? email) {
    final RegExp emailRegex = RegExp(
      r'^[a-z]+\.[a-z]{1}\.\d{4}\.[a-z0-9]+@ritchennai\.edu\.in$',
    );
    if (email == null || email.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid institutional email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'Xerox Arcade',
        logo: const AssetImage('assets/ritlogo.jpg'),
        onLogin: _authUser,
        onRecoverPassword: _recoverPassword,
        onSignup: _signupUser,
        userValidator: _emailValidator,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
        messages: LoginMessages(
          userHint: 'Email',
          passwordHint: 'Password',
          confirmPasswordHint: 'Confirm',
          loginButton: 'LOGIN',
          signupButton: 'REGISTER',
          forgotPasswordButton: 'Forgot Password ?',
          recoverPasswordButton: 'HELP',
          goBackButton: 'BACK',
          confirmPasswordError: 'Passwords do not match!',
          recoverPasswordIntro: 'We will send a recovery email.',
          recoverPasswordDescription: 'Enter your institutional email.',
          recoverPasswordSuccess: 'Check your inbox.',
        ),
        theme: LoginTheme(
          titleStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
