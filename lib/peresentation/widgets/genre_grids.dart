import 'package:flutter/material.dart';

class GenreGrids extends StatelessWidget {
  BoxConstraints constraints;
  String text;

  GenreGrids(
    this.constraints,
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: constraints.maxHeight * 0.5,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 131, 199, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
