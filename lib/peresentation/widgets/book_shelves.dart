import 'package:book_tracker/peresentation/screens/shelf_screen.dart';
import 'package:book_tracker/peresentation/widgets/list_details.dart';
import 'package:flutter/material.dart';

class BookShelves extends StatelessWidget {
  BoxConstraints constraints;

  BookShelves(
    this.constraints,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      alignment: Alignment.centerLeft,
      height: constraints.maxHeight * 0.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          'https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
