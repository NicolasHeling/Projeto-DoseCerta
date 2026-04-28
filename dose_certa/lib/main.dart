import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'pages/login_page.dart';
import 'pages/onboarding_page.dart';

void main() {
  runApp(const DoseCertaApp());
}

class DoseCertaApp extends StatelessWidget {
  const DoseCertaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dose Certa',
      debugShowCheckedModeBanner: false, // Tira aquela faixa de "DEBUG" da tela
      theme: ThemeData(
        primaryColor: AppColors.primaryRed,
        scaffoldBackgroundColor: AppColors.backgroundWhite,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
        useMaterial3: true,
      ),
      home:
          const OnboardingPage(), // Define a tela de Login como a primeira a abrir
    );
  }
}
