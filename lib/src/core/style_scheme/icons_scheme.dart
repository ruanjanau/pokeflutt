import 'package:flutter/material.dart';

class IconsScheme {
  IconData getIconByType(String type) {
    switch (type.toLowerCase()) {
      case 'grama':
        return Icons.eco;
      case 'veneno':
        return Icons.bubble_chart;
      case 'fogo':
        return Icons.local_fire_department;
      case 'água':
        return Icons.water_drop;

      case 'voador':
        return Icons.air_outlined;

      case 'inseto':
        return Icons.bug_report_outlined;

      default:
        return Icons.help_outline;
    }
  }
}
