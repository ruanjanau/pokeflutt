import 'package:flutter/material.dart';

class GenderProgressBar extends StatelessWidget {
  final double malePercentage;
  final double femalePercentage;

  const GenderProgressBar({
    super.key,
    required this.malePercentage,
    required this.femalePercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Row(
            children: [
              Expanded(
                flex: (malePercentage * 100).toInt(),
                child: Container(height: 10.0, color: Colors.blue),
              ),
              // Parte feminina
              Expanded(
                flex: (femalePercentage * 100).toInt(),
                child: Container(height: 10.0, color: Colors.pinkAccent),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.male, color: Colors.grey),
                SizedBox(width: 4.0),
                Text(
                  "${malePercentage.toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.female, color: Colors.grey),
                SizedBox(width: 4.0),
                Text(
                  "${femalePercentage.toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
