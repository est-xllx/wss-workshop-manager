import 'package:flutter/material.dart';

import '../models/equipment_item.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../widgets/counter_stepper.dart';
import 'summary_screen.dart';

class DetailScreen extends StatefulWidget {
  final EquipmentItem equipment;

  const DetailScreen({
    super.key,
    required this.equipment,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int rentalHours = 1;
  double powerLevel = 50;
  bool safetyConfirmed = false;

  @override
  Widget build(BuildContext context) {
    final equipment = widget.equipment;
    final totalPrice = equipment.hourlyRate * rentalHours;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Equipment Details'),
        backgroundColor: AppColors.card,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.lg),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Equipment Information Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.cardRadius,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(
                            alpha: 0.10,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          equipment.icon,
                          size: 52,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        equipment.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        equipment.category,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'S\$${equipment.hourlyRate.toStringAsFixed(2)} per hour',
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Rental Settings
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.cardRadius,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rental Duration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                      CounterStepper(
                        value: rentalHours,
                        onChanged: (newValue) {
                          setState(() {
                            rentalHours = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Power Level: ${powerLevel.round()}%',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                        value: powerLevel,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        label: '${powerLevel.round()}%',
                        activeColor: AppColors.primary,
                        onChanged: (value) {
                          setState(() {
                            powerLevel = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'Safety Confirmation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text(
                          'I understand the safety guidelines '
                              'for this equipment.',
                        ),
                        value: safetyConfirmed,
                        activeThumbColor: AppColors.primary,
                        onChanged: (value) {
                          setState(() {
                            safetyConfirmed = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Estimated Total
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.cardRadius,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Estimated Total',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'S\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$rentalHours hour(s) × '
                            'S\$${equipment.hourlyRate.toStringAsFixed(2)}',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Continue Button
                SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: safetyConfirmed
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SummaryScreen(
                            equipment: equipment,
                            rentalHours: rentalHours,
                            powerLevel: powerLevel,
                            totalPrice: totalPrice,
                          ),
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Continue to Summary',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
