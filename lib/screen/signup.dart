import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For making HTTP requests
import 'dart:convert'; // For encoding/decoding JSON

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  Future<void> _submitSignup() async {
    final url =
        'http://localhost:5000/api/signup'; // Replace with your backend signup API URL
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'mobile': int.parse(_mobileController.text),
        'address': {
          'name': _nameController.text,
          'address1': _address1Controller.text,
          'address2': _address2Controller.text,
          'city': _cityController.text,
          'state': _stateController.text,
          'zip': int.parse(_zipController.text),
        },
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Signup successful, handle navigation or show success message
    } else {
      // Signup failed, handle error (show error message, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name')),
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email')),
              TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password')),
              TextField(
                  controller: _mobileController,
                  decoration: InputDecoration(labelText: 'Mobile')),
              TextField(
                  controller: _address1Controller,
                  decoration: InputDecoration(labelText: 'Address Line 1')),
              TextField(
                  controller: _address2Controller,
                  decoration: InputDecoration(labelText: 'Address Line 2')),
              TextField(
                  controller: _cityController,
                  decoration: InputDecoration(labelText: 'City')),
              TextField(
                  controller: _stateController,
                  decoration: InputDecoration(labelText: 'State')),
              TextField(
                  controller: _zipController,
                  decoration: InputDecoration(labelText: 'Zip')),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _submitSignup, child: Text('Signup')),
            ],
          ),
        ),
      ),
    );
  }
}
