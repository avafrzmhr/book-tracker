
import 'package:flutter/material.dart';

class BookShelvesImage extends StatelessWidget {
  BoxConstraints constraints;
  String imgUrl;

  BookShelvesImage(
    this.imgUrl,
    this.constraints,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imgUrl,
        height: constraints.maxHeight * 0.18,
      ),
    );
  }
}
