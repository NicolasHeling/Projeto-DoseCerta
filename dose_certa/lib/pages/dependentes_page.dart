import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'new_dependente_page.dart';
import '../widgets/dose_certa_logo.dart';

class DependentesPage extends StatelessWidget {
  const DependentesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryRed,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.medication,
                        color: AppColors.primaryRed,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'DoseCerta',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dependentes',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryRed,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cuidados\nCompartilhados',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Gerencie a saúde de quem você\nama com precisão e carinho.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildDependenteItem(
                      name: 'João Silva',
                      relationship: 'Pai',
                      statusMessage: 'Medicamentos em dia',
                      statusType: 'success',
                      avatarColor: Colors.blueGrey.shade200,
                    ),
                    _buildDivider(),
                    _buildDependenteItem(
                      name: 'Maria Souza',
                      relationship: 'Mãe',
                      statusMessage: 'Aguardando confirmação',
                      statusType: 'pending',
                      avatarColor: Colors.teal.shade200,
                    ),
                    _buildDivider(),
                    _buildDependenteItem(
                      name: 'Ricardo Lima',
                      relationship: 'Tio',
                      statusMessage: '1 dose em atraso',
                      statusType: 'error',
                      avatarColor: AppColors.backgroundGrey,
                      isPlaceholder: true,
                    ),
                  ],
                ),
              ),
            ),

            // BOTÃO ATUALIZADO COM NAVEGAÇÃO
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewDependentePage(),
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
                        'Cadastrar Dependente',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
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

  Widget _buildDependenteItem({
    required String name,
    required String relationship,
    required String statusMessage,
    required String statusType,
    required Color avatarColor,
    bool isPlaceholder = false,
  }) {
    Color statusColor = statusType == 'success'
        ? Colors.teal
        : (statusType == 'pending'
              ? Colors.brown.shade400
              : AppColors.primaryRed);
    IconData statusIcon = statusType == 'success'
        ? Icons.check_circle
        : (statusType == 'pending' ? Icons.more_horiz : Icons.error);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: avatarColor,
                child: isPlaceholder
                    ? const Icon(
                        Icons.person_outline,
                        size: 28,
                        color: AppColors.textGrey,
                      )
                    : const Icon(Icons.person, size: 28, color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        relationship,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(statusIcon, color: statusColor, size: 14),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        statusMessage,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.backgroundGrey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.chevron_right,
              color: AppColors.textGrey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() =>
      Divider(color: Colors.grey.shade100, height: 24, thickness: 1);
}
