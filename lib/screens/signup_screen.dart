import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final locationController = TextEditingController();

  String role = 'farmer';

  void _signup() {
    Navigator.pushReplacementNamed(context, role == 'admin' ? '/admin' : '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: 'Full Name')),
              TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
              TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
              TextField(controller: locationController, decoration: InputDecoration(labelText: 'Location')),
              Row(
                children: [
                  Text('Role:'),
                  Radio(value: 'farmer', groupValue: role, onChanged: (val) => setState(() => role = val!)),
                  Text('Farmer'),
                  Radio(value: 'admin', groupValue: role, onChanged: (val) => setState(() => role = val!)),
                  Text('Admin'),
                ],
              ),
              ElevatedButton(onPressed: _signup, child: Text('Sign Up')),
            ],
          ),
        ),
      ),
    );
  }
}
