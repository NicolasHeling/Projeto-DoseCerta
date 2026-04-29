import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../pages/main_screen.dart';

class DoseCertaLogo extends StatelessWidget {
  const DoseCertaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Volta para a tela inicial limpando o histórico
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
