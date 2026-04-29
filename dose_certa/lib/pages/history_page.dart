import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/dose_certa_logo.dart'; // IMPORT DA LOGO

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DoseCertaLogo(), // LOGO CLICÁVEL AQUI
                  Row(
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        color: AppColors.textDark,
                      ),
                      const SizedBox(width: 16),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.backgroundGrey,
                        child: const Icon(
                          Icons.person,
                          size: 20,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              const Text(
                'Histórico',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryRed,
                ),
              ),
              const SizedBox(height: 24),

              // Abas (Hoje, Semana, Mês)
              Row(
                children: [
                  _buildTab('Hoje', isSelected: true),
                  const SizedBox(width: 12),
                  _buildTab('Semana'),
                  const SizedBox(width: 12),
                  _buildTab('Mês'),
                ],
              ),
              const SizedBox(height: 32),

              const Text(
                'Novembro 2024',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),

              _buildHistoryItem(
                time: '08:00',
                title: 'Paracetamol',
                subtitle: '500mg • 1 comprimido',
                statusText: 'TOMADO',
                isCompleted: true,
              ),
              _buildHistoryItem(
                time: '14:00',
                title: 'Vitamina D',
                subtitle: '45 gotas',
                statusText: 'TOMADO',
                isCompleted: true,
              ),
              _buildHistoryItem(
                time: '20:00',
                title: 'Ibuprofeno',
                subtitle: '400mg • 1 comprimido',
                statusText: 'ATRASADO',
                isCompleted: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryRed : AppColors.backgroundGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.textGrey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHistoryItem({
    required String time,
    required String title,
    required String subtitle,
    required String statusText,
    required bool isCompleted,
  }) {
    final Color statusColor = isCompleted ? Colors.teal : AppColors.primaryRed;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isCompleted
                  ? Colors.teal.withOpacity(0.1)
                  : AppColors.primaryRed.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCompleted ? Icons.check : Icons.close,
              color: statusColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
