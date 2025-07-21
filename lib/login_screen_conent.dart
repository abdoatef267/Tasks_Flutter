import 'package:flutter/material.dart';
import 'app_strings.dart';
import 'app_colors.dart';
import 'forget_password_row.dart';

class LoginScreenConente extends StatelessWidget {
  const LoginScreenConente({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: [
          Center(
            child: Text(
              AppStrings.loginScreenWelcomeText,
              style: TextStyle(
                color: AppColors.whiteApp,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),

          Center(
            child: Text(
              AppStrings.loginScreenSubTitle,
              style: TextStyle(
                color: AppColors.whiteApp,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),

          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.contact_phone, color: AppColors.mainColor),
                labelText: AppStrings.loginScreenPhonenumberTextFiled,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.lock, color: AppColors.mainColor),
                labelText: AppStrings.loginScreenPasswordTextFiled,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 5),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                AppStrings.loginScreenForgetPass,
                style: TextStyle(
                  color: AppColors.whiteApp,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Center(
            child: SizedBox(
              width: 250, 
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppStrings.loginButtonText,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          ForgetPasswordRow(
  secoednBlcakText: AppStrings.noAccount,
  firstWhiteText: AppStrings.createAccount,
  fontSize: 14,
  onWhiteTextTap: () {
    Navigator.pushNamed(context, '/signup');
  },
),
        ],
      ),
    );
  }
}
