import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class HowToRentItem extends StatelessWidget {
  final int step;
  final String title;
  final String desc;

  const HowToRentItem({
    super.key,
    required this.step,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGray),
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(
        maxWidth: 241,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.primaryGreen,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                '$step',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 13),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 241,
              ),
              child: Text(
                desc,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

