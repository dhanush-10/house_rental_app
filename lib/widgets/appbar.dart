import 'package:flutter/material.dart';

class AppBAR extends StatelessWidget {
  const AppBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
        backgroundColor: const Color.fromARGB(255, 221, 176, 41),
      ),
    );
  }
}
