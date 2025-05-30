import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              signOut()
                  .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logged out successfully')),
                    );
                    Navigator.pop(context);
                  })
                  .catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error logging out: $error')),
                    );
                  });
              // Navigate back to the previous screen
            },
          ),
        ],
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
