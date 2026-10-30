import 'package:flutter/material.dart';
import '../models/equipment_item.dart';
import '../widgets/equipment_card.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final equipmentList = EquipmentItem.equipmentList;
    final availableCount =
        equipmentList.where((item) => item.isAvailable).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      appBar: AppBar(
        title: const Text('Workshop Equipment'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E2022),
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF246BFD),
                  Color(0xFF5E93FF),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.handyman,
                  color: Colors.white,
                  size: 32,
                ),

                const SizedBox(height: 12),

                const Text(
                  'Equipment Catalog',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

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

          const SizedBox(height: 24),

          const Text(
            'Available Equipment',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

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
