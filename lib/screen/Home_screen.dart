import 'package\:flutter/material.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
final String email;
final String password;

const HomeScreen({super.key, required this.email, required this.password});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Welcome'),
backgroundColor: kSecondaryColor(context),
),
body: Padding(
padding: const EdgeInsets.all(24.0),
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
'Data yang kamu input:',
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
const SizedBox(height: 16),
Text('Email: \$email'),
const SizedBox(height: 8),
Text('Password: \$password'),
],
),
),
),
);
}
}