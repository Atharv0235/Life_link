import 'package:flutter/material.dart';

class ERDashboard extends StatelessWidget {
  final String erName;
  const ERDashboard({super.key, required this.erName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ER Dashboard - $erName'),
        backgroundColor: const Color(0xFFC62828),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_hospital, size: 80, color: Color(0xFFC62828)),
            const SizedBox(height: 24),
            Text(
              'Welcome to $erName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Awaiting incoming emergency alerts...',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
