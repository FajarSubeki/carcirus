import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size.fromHeight(50)),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.buttonGreen.withValues(alpha: 0.4);
            }
            return AppColors.buttonGreen;
          },
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevation: WidgetStateProperty.resolveWith<double>(
              (states) => states.contains(WidgetState.disabled) ? 0 : 2,
        ),
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
          fontSize: 16
        ),
      ),
    );
  }
}
