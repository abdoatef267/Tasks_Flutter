import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'welcome_screen_content.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteApp,
      body: Column(
        children: [
          // الجزء العلوي الأبيض
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.whiteApp,
            ),
          ),

          Container(
            width: double.infinity, 
            height: 400, 
            decoration: const BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const WelcomeScreenContent(),
          ),
        ],
      ),
    );
  }
}
