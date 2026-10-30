import 'package:flutter/material.dart';
import '../models/equipment_item.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_styles.dart';
import 'custom_badge.dart';

class EquipmentCard extends StatelessWidget {
  final EquipmentItem equipment;
  final VoidCallback onTap;

  const EquipmentCard({
    super.key,
    required this.equipment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      elevation: 2,
      margin: const EdgeInsets.only(
        bottom: AppDimensions.md,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.cardRadius,
        ),
      ),
      child: InkWell(
        onTap: equipment.isAvailable ? onTap : null,
        borderRadius: BorderRadius.circular(
          AppDimensions.cardRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.md),
          child: Row(
            children: [
              Container(
                width: AppDimensions.cardIconBox,
                height: AppDimensions.cardIconBox,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  equipment.icon,
                  size: AppDimensions.iconSize,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppDimensions.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      equipment.name,
                      style: AppStyles.cardTitle,
                    ),
                    const SizedBox(height: AppDimensions.xs),
                    Text(
                      equipment.category,
                      style: AppStyles.subtitle,
                    ),
                    const SizedBox(height: AppDimensions.sm),
                    Text(
                      'S\$${equipment.hourlyRate.toStringAsFixed(2)}/hr',
                      style: AppStyles.price,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppDimensions.sm),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomBadge(
                    isAvailable: equipment.isAvailable,
                  ),
                  const SizedBox(height: AppDimensions.sm),
                  Icon(
                    Icons.chevron_right,
                    color: equipment.isAvailable
                        ? AppColors.textMuted
                        : Colors.grey.shade300,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
