import 'package:flutter/material.dart';
import '../models/equipment_item.dart';
import '../widgets/equipment_card.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_styles.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final equipmentList = EquipmentItem.equipmentList;
    final availableCount =
        equipmentList.where((item) => item.isAvailable).length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Workshop Equipment',
          style: AppStyles.pageTitle,
        ),
        backgroundColor: AppColors.card,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.lg),
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.lg),
            decoration: BoxDecoration(
              gradient: AppColors.headerGradient,
              borderRadius: BorderRadius.circular(
                AppDimensions.bannerRadius,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.handyman,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(height: AppDimensions.md),
                const Text(
                  'Equipment Catalog',
                  style: AppStyles.bannerTitle,
                ),
                const SizedBox(height: AppDimensions.sm),
                Text(
                  '$availableCount of ${equipmentList.length} '
                      'equipment available',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.lg),
          const Text(
            'Available Equipment',
            style: AppStyles.sectionTitle,
          ),
          const SizedBox(height: AppDimensions.md),
          ...equipmentList.map(
                (equipment) => EquipmentCard(
              equipment: equipment,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${equipment.name} selected',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
