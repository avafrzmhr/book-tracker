import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListDetailsWidget extends StatelessWidget {
  String firstText;
  String secondText;

  ListDetailsWidget(this.firstText, this.secondText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(firstText),
        const SizedBox(
          height: 10,
        ),
        Text(secondText),
      ],
    );
  }
}
