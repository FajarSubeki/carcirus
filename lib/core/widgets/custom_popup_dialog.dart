import 'package:carcirus/core/resources/app_colors.dart';
import 'package:carcirus/core/widgets/app_button.dart';
import 'package:carcirus/core/widgets/outline_button.dart';
import 'package:flutter/material.dart';

class CustomPopupDialog extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final String primaryText;
  final VoidCallback onPrimaryPressed;
  final String? secondaryText;
  final VoidCallback? onSecondaryPressed;

  const CustomPopupDialog({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.primaryText,
    required this.onPrimaryPressed,
    this.secondaryText,
    this.onSecondaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon section
            Image.asset(
              iconPath,
              width: 78,
              height: 78,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.gray2,
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            if (secondaryText != null && onSecondaryPressed != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      text: secondaryText!,
                      onPressed: onSecondaryPressed!,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton(
                      text: primaryText,
                      onPressed: onPrimaryPressed,
                    ),
                  ),
                ],
              )
            else
              AppOutlinedButton(
                text: primaryText,
                onPressed: onPrimaryPressed,
              ),
          ],
        ),
      ),
    );
  }
}
