import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class DateTimePicker extends StatelessWidget {
  final String label;
  final String value;
  final String iconPath;
  final VoidCallback? onTap;

  const DateTimePicker({
    super.key,
    required this.label,
    required this.value,
    required this.iconPath,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontSize: 14
              )
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value,
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary
                    )
                ),
                Image.asset(
                  iconPath,
                  width: 15,
                  height: 15,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

