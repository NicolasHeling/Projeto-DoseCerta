import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/custom_text_field.dart';
import 'success_page.dart'; // Import da tela de sucesso
import 'main_screen.dart'; // Import da tela principal

class NewAppointmentPage extends StatelessWidget {
  const NewAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textDark),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Nova Consulta',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primaryRed, Color(0xFFD32F2F)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.all(24.0),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        'Consulta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    const CustomTextField(
                      label: 'Nome do Médico',
                      hint: 'Ex: Ana Luiza',
                      icon: Icons.edit_outlined,
                    ),
                    const CustomTextField(
                      label: 'Especialidade',
                      hint: 'Ex: Clínico Geral',
                      icon: Icons.badge_outlined,
                    ),
                    const CustomTextField(
                      label: 'Data',
                      hint: 'Ex: 25 de Outubro de 2026',
                      icon: Icons.calendar_today_outlined,
                    ),
                    const CustomTextField(
                      label: 'Local',
                      hint: 'Ex: Hospital Geral Unimed',
                      icon: Icons.keyboard_arrow_down,
                    ),
                    const CustomTextField(
                      label: 'Horário',
                      hint: 'Ex: 14:30',
                      icon: Icons.keyboard_arrow_down,
                    ),
                    const CustomTextField(
                      label: 'Dependente',
                      hint: 'Maria Souza',
                      icon: Icons.keyboard_arrow_down,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // NAVEGAÇÃO PARA A TELA DE SUCESSO
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessPage(
                          title: 'Cadastro Realizado\ncom Sucesso!',
                          subtitle: 'Sua consulta foi agendada.',
                          buttonText: 'Ir para o Início',
                          onButtonPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 4,
                    shadowColor: AppColors.primaryRed.withOpacity(0.4),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Salvar Consulta',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.check_circle, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
