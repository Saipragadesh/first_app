import 'package:flutter/material.dart';

import '../widgets/app_text_field.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 28),
                Container(
                  width: 58,
                  height: 58,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: const Color(0xFFE0E7FF), borderRadius: BorderRadius.circular(18)),
                  child: const Icon(Icons.groups_rounded, color: Color(0xFF4F46E5), size: 30),
                ),
                const SizedBox(height: 24),
                const Text('Welcome back', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Color(0xFF1E1B4B))),
                const SizedBox(height: 8),
                const Text('Sign in to continue learning with your peers.', style: TextStyle(fontSize: 16, color: Color(0xFF64748B))),
                const SizedBox(height: 36),
                AppTextField(
                  controller: _emailController,
                  label: 'Email', hint: 'Enter your email', keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value.trim().isEmpty ? 'Email is required' : !value.contains('@') ? 'Enter a valid email' : null,
                ),
                const SizedBox(height: 18),
                AppTextField(
                  controller: _passwordController, label: 'Password', hint: 'Enter your password', obscureText: true,
                  validator: (value) => value == null || value.isEmpty ? 'Password is required' : value.length < 6 ? 'Password must be at least 6 characters' : null,
                ),
                const SizedBox(height: 32),
                ElevatedButton(onPressed: _login, child: const Text('Login')),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Don't have an account? "),
                  TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen())), child: const Text('Sign Up')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
