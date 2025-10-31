import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class RentBenefitItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const RentBenefitItem({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          height: 36,
          width: 37,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary
            ),
          ),
        ),
      ],
    );
  }
}

class RentBenefitItemData {
  final String title;
  final String imagePath;

  RentBenefitItemData({
    required this.title,
    required this.imagePath,
  });
}
