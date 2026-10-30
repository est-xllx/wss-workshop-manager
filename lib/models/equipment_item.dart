import 'package:flutter/material.dart';

class EquipmentItem {
  final String id;
  final String name;
  final String category;
  final IconData icon;
  final double hourlyRate;
  final bool isAvailable;

  const EquipmentItem({
    required this.id,
    required this.name,
    required this.category,
    required this.icon,
    required this.hourlyRate,
    required this.isAvailable,
  });

  static const List<EquipmentItem> equipmentList = [
    EquipmentItem(
      id: 'EQ001',
      name: '3D Printer',
      category: 'Fabrication',
      icon: Icons.print,
      hourlyRate: 15.00,
      isAvailable: true,
    ),
    EquipmentItem(
      id: 'EQ002',
      name: 'Laser Cutter',
      category: 'Fabrication',
      icon: Icons.precision_manufacturing,
      hourlyRate: 20.00,
      isAvailable: true,
    ),
    EquipmentItem(
      id: 'EQ003',
      name: 'CNC Machine',
      category: 'Machining',
      icon: Icons.settings,
      hourlyRate: 25.00,
      isAvailable: false,
    ),
    EquipmentItem(
      id: 'EQ004',
      name: 'Power Drill',
      category: 'Power Tools',
      icon: Icons.handyman,
      hourlyRate: 8.00,
      isAvailable: true,
    ),
  ];
}
