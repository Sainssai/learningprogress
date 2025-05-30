import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learningprogress/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login successful")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              String username = usernameController.text;
              String password = passwordController.text;

              // Here you would typically handle the login logic, such as
              // sending the credentials to a server or checking them against
              // a local database.
              if (username.isNotEmpty && password.isNotEmpty) {
                signIn(username, password, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter both fields')),
                );
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
