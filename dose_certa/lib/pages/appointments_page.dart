import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'new_appointment_page.dart';
import '../widgets/dose_certa_logo.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  // Cores específicas para as "pílulas" de status desta tela
  final Color _successText = const Color(0xFF2E7D32); // Verde escuro
  final Color _successBg = const Color(0xFFE8F5E9); // Verde bem claro
  final Color _cancelText = const Color(0xFF757575); // Cinza escuro
  final Color _cancelBg = const Color(0xFFF5F5F5); // Cinza claro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Parte rolável (Cabeçalho, Busca e Lista)
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
                            Text(
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
                      'Consultas',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryRed,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Barra de Busca
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar por médico ou especialidade',
                        hintStyle: const TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 15,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.textDark,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundGrey,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Lista de Consultas
                    _buildAppointmentItem(
                      doctorName: 'Dra. Ana Silva',
                      specialty: 'Cardiologia',
                      date: '15 Jan, 2024',
                      time: '14:30',
                      statusText: 'REALIZADA',
                      isCompleted: true,
                      doctorAvatarColor: Colors.blueGrey.shade100,
                      patientAvatarColor: Colors.brown.shade200,
                    ),

                    const SizedBox(height: 32),

                    _buildAppointmentItem(
                      doctorName: 'Dr. Marcos Lima',
                      specialty: 'Dermatologia',
                      date: '08 Jan, 2024',
                      time: '10:00',
                      statusText: 'CANCELADA',
                      isCompleted: false,
                      doctorAvatarColor: Colors.blueGrey.shade800,
                      patientAvatarColor: Colors.teal.shade200,
                    ),
                  ],
                ),
              ),
            ),

            // Botão Cadastrar Consulta fixo na parte inferior
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navega para a tela de Nova Consulta
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewAppointmentPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cadastrar Consulta',
                        style: TextStyle(
                          fontSize: 18,
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

  // Widget customizado para o item da lista de consultas
  Widget _buildAppointmentItem({
    required String doctorName,
    required String specialty,
    required String date,
    required String time,
    required String statusText,
    required bool isCompleted,
    required Color doctorAvatarColor,
    required Color patientAvatarColor,
  }) {
    // Define as cores com base no status
    final Color statusTextColor = isCompleted ? _successText : _cancelText;
    final Color statusBgColor = isCompleted ? _successBg : _cancelBg;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar do Médico
        CircleAvatar(
          radius: 28,
          backgroundColor: doctorAvatarColor,
          child: const Icon(Icons.person, size: 32, color: Colors.white),
        ),
        const SizedBox(width: 16),

        // Informações da Consulta
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nome do Médico e Pill de Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Pílula de Status
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: statusTextColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          statusText,
                          style: TextStyle(
                            color: statusTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // Especialidade
              Text(
                specialty,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 12),

              // Avatar do Paciente (Pequeno)
              CircleAvatar(
                radius: 14,
                backgroundColor: patientAvatarColor,
                child: const Icon(Icons.person, size: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),

              // Data e Hora
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 6),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.access_time_outlined,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 6),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
