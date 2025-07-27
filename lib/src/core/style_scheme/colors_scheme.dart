import 'package:flutter/material.dart';

class ColorsScheme {
  Color getColorByType(String type) {
    switch (type.toLowerCase()) {
      case 'grama':
        return Colors.green.shade700;
      case 'veneno':
        return Colors.purple.shade400;
      case 'fogo':
        return Colors.orange.shade600;
      case 'água':
        return Colors.blue.shade600;
      case 'voador':
        return Colors.lightBlueAccent;
      case 'inseto':
        return Colors.brown.shade700;
      case 'gelo':
        return Colors.blue;
      case 'psíquico':
        return Colors.deepPurple;
      case 'terrestre':
        return Colors.brown.shade600;
      case 'pedra':
        return Colors.brown.shade300;
      case 'elétrico':
        return Colors.yellow.shade700;
      default:
        return Colors.grey;
    }
  }
}
