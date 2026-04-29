import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'pages/onboarding_page.dart'; // Ou login_page.dart, se preferir

void main() {
  runApp(const DoseCertaApp());
}

class DoseCertaApp extends StatelessWidget {
  const DoseCertaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dose Certa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        // MELHORIA 2: Fundo branco para todas as telas do app
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
      ),
      home: const OnboardingPage(),
    );
  }
}
