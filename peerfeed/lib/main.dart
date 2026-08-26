import 'package:flutter/material.dart';

import '../../screens/splash_screen.dart';

void main() {
  runApp(const PeerFeedApp());
}

class PeerFeedApp extends StatelessWidget {
  const PeerFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    const brandColor = Color(0xFF4F46E5);

    return MaterialApp(
      title: 'PeerFeed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandColor,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8FAFC),
          foregroundColor: Color(0xFF1E1B4B),
          centerTitle: false,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: brandColor,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
