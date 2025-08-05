import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final mockUsers = [
    {'email': 'admin@local.com', 'password': 'admin123', 'role': 'admin'},
    {'email': 'farmer@local.com', 'password': 'farmer123', 'role': 'farmer'},
  ];

  String error = '';

  void _login() {
    final email = emailController.text;
    final password = passwordController.text;
    final user = mockUsers.firstWhere(
      (u) => u['email'] == email && u['password'] == password,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      Navigator.pushReplacementNamed(context, user['role'] == 'admin' ? '/admin' : '/home');
    } else {
      setState(() => error = 'Invalid credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
            if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red)),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
