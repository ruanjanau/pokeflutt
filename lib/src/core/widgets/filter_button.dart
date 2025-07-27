import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Filtrar por tipo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.white, size: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
