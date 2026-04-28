import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/dose_certa_logo.dart';

class NewDependentePage extends StatefulWidget {
  const NewDependentePage({super.key});

  @override
  State<NewDependentePage> createState() => _NewDependentePageState();
}

class _NewDependentePageState extends State<NewDependentePage> {
  // Variável para controlar qual parentesco está selecionado
  String selectedParentesco = "Filho";

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
                    'Novo Dependente',
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
                    // Card Vermelho "Dependente"
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
                        'Dependente',
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
                      label: 'NOME COMPLETO',
                      hint: 'Ex: João',
                      icon: Icons.person_outline,
                    ),
                    _buildInputField(
                      label: 'DATA DE NASCIMENTO',
                      hint: '00/00/0000',
                      icon: Icons.calendar_today_outlined,
                    ),

                    const SizedBox(height: 8),
                    const Text(
                      'GRAU DE PARENTESCO',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Botões de Seleção (Parentesco)
                    Wrap(
                      spacing: 8,
                      runSpacing: 12,
                      children: [
                        _buildChoiceChip('Filho'),
                        _buildChoiceChip('Mãe'),
                        _buildChoiceChip('Pai'),
                        _buildChoiceChip('Cônjuge'),
                        _buildChoiceChip('Outro'),
                      ],
                    ),
                    const SizedBox(height: 32),
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
                    // Lógica para salvar
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
                        'Salvar Dependente',
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

  // Widget para os campos de texto
  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
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

  // Widget para os botões de escolha (chips)
  Widget _buildChoiceChip(String label) {
    bool isSelected = selectedParentesco == label;
    return GestureDetector(
      onTap: () => setState(() => selectedParentesco = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.backgroundGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textGrey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
