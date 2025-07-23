import 'package:flutter/material.dart';

class InfoDetailComponent extends StatelessWidget {
  final String infoOne;
  final String infoTwo;
  final IconData iconOne;
  final IconData iconTwo;
  final String detailOne;
  final String detailTwo;

  const InfoDetailComponent({
    super.key,
    required this.infoOne,
    required this.infoTwo,
    required this.iconOne,
    required this.iconTwo,
    required this.detailOne,
    required this.detailTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Primeiro bloco
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(iconOne, size: 24.0, color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text(
                    detailOne,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 4.0),
              Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(
                  child: Text(
                    infoOne,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.0), // Espaço entre os blocos
        // Segundo bloco
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(iconTwo, size: 24.0, color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text(
                    detailTwo,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 4.0),
              Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(
                  child: Text(
                    infoTwo,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
