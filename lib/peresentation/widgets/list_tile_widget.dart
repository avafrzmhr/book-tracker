import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  String text;
  BoxConstraints constraints;

  ListTileWidget(this.text, this.constraints);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        width: constraints.maxWidth * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(179, 233, 239, 255),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          title: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
            child: const Icon(
              Icons.menu_book_rounded,
            ),
          ),
        ),
      ),
    );
  }
}
