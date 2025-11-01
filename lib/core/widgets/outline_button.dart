import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = enabled
        ? AppColors.borderGray
        : Colors.grey.withValues(alpha: 0.3);

    final Color textColor = enabled
        ? AppColors.textBlack03
        : AppColors.gray2;

    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(color: borderColor, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
