import 'package:flutter/material.dart';
import 'app_strings.dart';
import 'app_colors.dart';
import 'forget_password_row.dart';

class SignUpScreenContent extends StatefulWidget {
  const SignUpScreenContent({super.key});

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // حقل الاسم
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.person, color: AppColors.mainColor),
                labelText: AppStrings.name,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // حقل البريد الإلكتروني
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.email, color: AppColors.mainColor),
                labelText: AppStrings.email,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // حقل كلمة المرور
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.lock, color: AppColors.mainColor),
                labelText: AppStrings.password,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Directionality(
  textDirection: TextDirection.rtl,
  child: TextField(
    obscureText: true,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(Icons.lock_outline, color: AppColors.mainColor),
      labelText: AppStrings.confirmPassword,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
),
const SizedBox(height: 15),

          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
                activeColor: AppColors.yellow,
              ),
              Text(
                AppStrings.agreeTo,
                style: const TextStyle(color: AppColors.yellow, fontSize: 14),
              ),
              const SizedBox(width: 5),
              Text(
                AppStrings.termsAndConditions,
                style: const TextStyle(color: AppColors.whiteApp, fontSize: 14),
              ),
            ],
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
                  AppStrings.createAccount,
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
            secoednBlcakText: AppStrings.haveAccount,
            firstWhiteText: AppStrings.login,
            fontSize: 14,
            onWhiteTextTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
