import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/dose_certa_logo.dart';

class NewMedicationPage extends StatelessWidget {
  const NewMedicationPage({super.key});

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
                    onPressed: () {
                      // Fecha a tela e volta para a anterior
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Novo Medicamento',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                  ), // Espaçamento para centralizar o título
                ],
              ),
            ),

            // Corpo Rolável (Card e Formulário)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card Vermelho "Medicamento"
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryRed,
                            AppColors.primaryRed.withOpacity(0.85),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.all(24.0),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        'Medicamento',
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
                      label: 'Nome do Medicamento',
                      hint: 'Ex: Paracetamol',
                      icon: Icons.edit_outlined,
                    ),
                    _buildInputField(
                      label: 'Dosagem',
                      hint: 'Ex: 500mg',
                      icon: Icons.linear_scale,
                    ),
                    _buildInputField(
                      label: 'Duração',
                      hint: 'Ex: 7 dias',
                      icon: Icons.calendar_today_outlined,
                    ),
                    _buildInputField(
                      label: 'Frequência',
                      hint: 'A cada 8 horas',
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

            // Botão "Salvar Medicamento" fixo embaixo
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Ação de salvar o medicamento
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
                        'Salvar Medicamento',
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

  // Função auxiliar para criar os campos de texto do formulário
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
