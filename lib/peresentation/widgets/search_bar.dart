import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  TextEditingController searchController;
  void Function()? onPressed;

  SearchBarWidget(
    this.searchController,
    this.onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 50,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIconColor: const Color.fromARGB(255, 209, 207, 203),
              suffixIconColor: const Color.fromARGB(255, 209, 207, 203),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 209, 207, 203),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 209, 207, 203),
                ),
              ),
              hintText: 'Search...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => searchController.clear(),
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: onPressed,
              ),
            ),
          ),
        ),
      );
    });
  }
}
