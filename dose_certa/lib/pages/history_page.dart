import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Cores específicas desta tela
  final Color _lightRed = const Color(0xFFFDECEB);
  final Color _successGreen = const Color(0xFF00796B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cabeçalho (Logo e Perfil)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.medication, color: AppColors.primaryRed),
                            SizedBox(width: 8),
                            const Text(
                              'DoseCerta',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                          ],
                        ),
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

                    // Título
                    const Text(
                      'Histórico',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryRed,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Selecionador de Mês
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Outubro 2025',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        Row(
                          children: [
                            _buildMonthNavigationButton(Icons.chevron_left),
                            const SizedBox(width: 8),
                            _buildMonthNavigationButton(Icons.chevron_right),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Calendário
                    _buildCalendarView(),
                    const SizedBox(height: 40),

                    // Cards de Resumo (Usuário 1)
                    _buildUserStatsRow(
                      avatarColor: Colors.blue.shade100,
                      dosesTomadas: '124',
                      dosesPerdidas: '02',
                    ),
                    const SizedBox(height: 24),

                    // Cards de Resumo (Usuário 2)
                    _buildUserStatsRow(
                      avatarColor: Colors.brown.shade200,
                      dosesTomadas: '124',
                      dosesPerdidas: '02',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthNavigationButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: AppColors.backgroundGrey,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.textDark, size: 20),
    );
  }

  Widget _buildCalendarView() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['DOM', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB']
                .map(
                  (day) => SizedBox(
                    width: 32,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDayCell('28', isFaded: true),
              _buildDayCell('29', isFaded: true),
              _buildDayCell('30', isFaded: true),
              _buildDayCell('1', status: 'check'),
              _buildDayCell('2', status: 'check'),
              _buildDayCell('3', status: 'cross'),
              _buildDayCell('4', status: 'check'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDayCell('5', status: 'check'),
              _buildDayCell('6', status: 'check'),
              _buildDayCell('7', status: 'cross'),
              _buildDayCell('8', status: 'check', isSelected: true),
              _buildDayCell('9', status: 'check'),
              _buildDayCell('10', status: 'check'),
              _buildDayCell('11', status: 'check'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDayCell('12'),
              _buildDayCell('13'),
              _buildDayCell('14'),
              _buildDayCell('15'),
              _buildDayCell('16'),
              _buildDayCell('17'),
              _buildDayCell('18'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayCell(
    String day, {
    bool isFaded = false,
    bool isSelected = false,
    String? status,
  }) {
    return Container(
      width: 36,
      height: 48,
      decoration: BoxDecoration(
        color: isSelected ? _lightRed : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isFaded
                  ? Colors.grey.shade400
                  : (isSelected ? AppColors.primaryRed : AppColors.textDark),
            ),
          ),
          const SizedBox(height: 2),
          if (status == 'check')
            Icon(Icons.check_circle, color: _successGreen, size: 12)
          else if (status == 'cross')
            const Icon(Icons.cancel, color: AppColors.primaryRed, size: 12)
          else
            const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildUserStatsRow({
    required Color avatarColor,
    required String dosesTomadas,
    required String dosesPerdidas,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: avatarColor,
          child: const Icon(Icons.person, size: 40, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.checklist_rtl, color: _successGreen, size: 24),
                      const SizedBox(height: 8),
                      Text(
                        dosesTomadas,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const Text(
                        'DOSES TOMADAS',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6D4C41),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.event_busy,
                        color: AppColors.primaryRed,
                        size: 24,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dosesPerdidas,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const Text(
                        'DOSES PERDIDAS',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6D4C41),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
