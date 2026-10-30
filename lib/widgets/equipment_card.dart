import 'package:flutter/material.dart';
import '../models/equipment_item.dart';

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
    final available = equipment.isAvailable;

    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: available ? onTap : null,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  equipment.icon,
                  size: 30,
                  color: const Color(0xFF246BFD),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      equipment.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      equipment.category,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'S\$${equipment.hourlyRate.toStringAsFixed(2)}/hr',
                      style: const TextStyle(
                        color: Color(0xFF246BFD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: available
                          ? const Color(0xFFE2F8ED)
                          : const Color(0xFFFFE8E8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      available ? 'Available' : 'In Use',
                      style: TextStyle(
                        color: available
                            ? const Color(0xFF16834A)
                            : const Color(0xFFD64545),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Icon(
                    Icons.chevron_right,
                    color: available
                        ? Colors.grey
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
