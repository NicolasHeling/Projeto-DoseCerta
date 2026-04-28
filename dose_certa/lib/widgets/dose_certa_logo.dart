import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart'; // Ajuste o caminho se necessário
import '../pages/main_screen.dart'; // Importa a tela principal para poder voltar pra ela

class DoseCertaLogo extends StatelessWidget {
  const DoseCertaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Apaga o histórico e volta para a MainScreen (Início)
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (Route<dynamic> route) => false,
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
