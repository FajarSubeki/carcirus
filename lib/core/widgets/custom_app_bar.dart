import 'package:carcirus/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? iconPath;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.iconPath,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      leading: IconButton(
        onPressed: onBack ?? () => Navigator.pop(context),
        icon: iconPath != null
            ? Image.asset(
          iconPath!,
          width: 16,
          height: 16,
          fit: BoxFit.contain,
        )
            : const Icon(Icons.arrow_back, color: AppColors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
