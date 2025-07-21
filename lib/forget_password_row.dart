import 'package:flutter/material.dart';
import 'app_colors.dart';

class ForgetPasswordRow extends StatelessWidget {
  final String? firstWhiteText;
  final String? secoednBlcakText;
  final double fontSize;
  final VoidCallback? onWhiteTextTap;

  const ForgetPasswordRow({
    super.key,
    this.firstWhiteText,
    this.secoednBlcakText,
    this.fontSize = 16,
    this.onWhiteTextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            secoednBlcakText ?? '',
            style: TextStyle(
              color: AppColors.whiteBloc,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onWhiteTextTap,
            child: Text(
              firstWhiteText ?? '',
              style: TextStyle(
                color: AppColors.whiteApp,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
