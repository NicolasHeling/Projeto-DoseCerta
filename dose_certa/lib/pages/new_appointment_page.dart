import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/dose_certa_logo.dart';

class NewAppointmentPage extends StatelessWidget {
  const NewAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho (Botão Fechar e Título)
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
                  const SizedBox(width: 48), // Equilíbrio visual
                ],
              ),
            ),

            // Corpo Rolável
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card Vermelho "Consulta"
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

                    // Formulário
                    _buildInputField(
                      label: 'Nome do Médico',
                      hint: 'Ex: Ana Luiza',
                      icon: Icons.edit_outlined,
                    ),
                    _buildInputField(
                      label: 'Especialidade',
                      hint: 'Ex: Clínico Geral',
                      icon: Icons.badge_outlined,
                    ),
                    _buildInputField(
                      label: 'Data',
                      hint: 'Ex: 25 de Outubro de 2026',
                      icon: Icons.calendar_today_outlined,
                    ),
                    _buildInputField(
                      label: 'Local',
                      hint: 'Ex: Hospital Geral Unimed',
                      icon: Icons.keyboard_arrow_down,
                    ),
                    _buildInputField(
                      label: 'Horário',
                      hint: 'Ex: 14:30',
                      icon: Icons.keyboard_arrow_down,
                    ),
                    _buildInputField(
                      label: 'Dependente',
                      hint: 'Maria Souza',
                      icon: Icons.keyboard_arrow_down,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Botão Salvar
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para salvar futuramente
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

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: AppColors.textGrey,
                fontSize: 15,
              ),
              suffixIcon: Icon(icon, color: AppColors.textGrey, size: 22),
              filled: true,
              fillColor: AppColors.backgroundGrey,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
