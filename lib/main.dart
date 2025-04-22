import 'package:flutter/material.dart';
import 'homepage_JCMD.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 18,
          color: Colors.amberAccent,
        ),
      ),
    ),
    home: Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      body: Center(child: LoginForm()),
    ),
  ));
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomepageJcmd()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter both your username and password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Prevent unnecessary stretching
      children: [
        Image.asset(
          'assets/A.png', // Ensure this path is correct
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Text('Sign In', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Please enter your details'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: _usernameController, // Fix: Assigned controller
            decoration: InputDecoration(labelText: 'Username'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: _passwordController, // Fix: Assigned controller
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _handleLogin,
          child: Text('Sign In'),
        ),
      ],
    );
  }
}