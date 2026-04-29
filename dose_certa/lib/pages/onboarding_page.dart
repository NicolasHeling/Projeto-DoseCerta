import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              // Logo Central
              Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed,
                    borderRadius: BorderRadius.circular(
                      32,
                    ), // Borda bem arredondada
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryRed.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons
                        .medication, // Ícone temporário até você colocar a imagem do Figma
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Título com duas cores (RichText)
              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      letterSpacing:
                          -1.5, // Deixa as letras mais juntinhas igual na imagem
                    ),
                    children: [
                      TextSpan(
                        text: 'Dose',
                        style: TextStyle(color: AppColors.primaryRed),
                      ),
                      TextSpan(
                        text: 'Certa',
                        style: TextStyle(color: AppColors.textDark),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Botão Uso Pessoal
              SizedBox(
                height: 64,
                child: ElevatedButton(
                  onPressed: () {
                    // Navega para a tela de Login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // Menos arredondado que o botão padrão
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Uso Pessoal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaço entre os botões
              // Botão Responsável
              SizedBox(
                height: 64,
                child: ElevatedButton(
                  onPressed: () {
                    // Navega para a tela de Login (futuramente pode ir para outro fluxo)
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Responsável',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
