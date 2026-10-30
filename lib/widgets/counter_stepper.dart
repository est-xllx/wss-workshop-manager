import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CounterStepper extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const CounterStepper({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filledTonal(
          onPressed: value > min
              ? () => onChanged(value - 1)
              : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 55,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
        IconButton.filled(
          onPressed: value < max
              ? () => onChanged(value + 1)
              : null,
          icon: const Icon(Icons.add),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
