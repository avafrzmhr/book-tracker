import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListDetailsWidget extends StatelessWidget {
  String firstText;

  ListDetailsWidget(this.firstText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          firstText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
