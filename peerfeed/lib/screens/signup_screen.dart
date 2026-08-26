import 'package:flutter/material.dart';

import '../widgets/app_text_field.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text('Join PeerFeed', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Create an account to get started.', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 30),
                AppTextField(controller: _nameController, label: 'Name', hint: 'Enter your name', validator: (value) => value == null || value.trim().isEmpty ? 'Name is required' : null),
                const SizedBox(height: 18),
                AppTextField(controller: _emailController, label: 'Email', hint: 'Enter your email', keyboardType: TextInputType.emailAddress, validator: (value) => value == null || value.trim().isEmpty ? 'Email is required' : !value.contains('@') ? 'Enter a valid email' : null),
                const SizedBox(height: 18),
                AppTextField(controller: _passwordController, label: 'Password', hint: 'Create a password', obscureText: true, validator: (value) => value == null || value.isEmpty ? 'Password is required' : value.length < 6 ? 'Password must be at least 6 characters' : null),
                const SizedBox(height: 18),
                AppTextField(controller: _confirmPasswordController, label: 'Confirm Password', hint: 'Enter your password again', obscureText: true, validator: (value) => value == null || value.isEmpty ? 'Please confirm your password' : value != _passwordController.text ? 'Passwords do not match' : null),
                const SizedBox(height: 30),
                ElevatedButton(onPressed: _signup, child: const Text('Create Account')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
