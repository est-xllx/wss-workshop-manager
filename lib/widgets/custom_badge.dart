import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';

class CustomBadge extends StatelessWidget {
  final bool isAvailable;

  const CustomBadge({
    super.key,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: isAvailable
            ? AppColors.successBackground
            : AppColors.dangerBackground,
        borderRadius: BorderRadius.circular(
          AppDimensions.badgeRadius,
        ),
      ),
      child: Text(
        isAvailable ? 'Available' : 'In Use',
        style: TextStyle(
          color: isAvailable
              ? AppColors.success
              : AppColors.danger,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
