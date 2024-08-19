import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _errorMessage;

  void _login(String email, String password) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await _authService.signIn(email, password);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginForm(onSubmit: _login),
            if (_errorMessage != null) ...[
              SizedBox(height: 16.0),
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ],
            if (_isLoading) ...[
              SizedBox(height: 16.0),
              CircularProgressIndicator(),
            ],
          ],
        ),
      ),
    );
  }
}
