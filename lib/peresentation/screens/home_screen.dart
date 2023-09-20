import 'package:book_tracker/peresentation/widgets/book_shelves.dart';
import 'package:book_tracker/peresentation/widgets/list_details.dart';
import 'package:book_tracker/peresentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import 'shelf_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SearchBarWidget(_searchController, () {}),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ShelfScreen.routename);
                    },
                    child: Row(
                      children: [
                        BookShelves(constraints),
                        const SizedBox(
                          width: 20,
                        ),
                        ListDetailsWidget('Read', '15 Books'),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black26,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ShelfScreen.routename);
                    },
                    child: Row(
                      children: [
                        BookShelves(constraints),
                        const SizedBox(
                          width: 20,
                        ),
                        ListDetailsWidget('Currently Reading', '15 Books'),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black26,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ShelfScreen.routename);
                    },
                    child: Row(
                      children: [
                        BookShelves(constraints),
                        const SizedBox(
                          width: 20,
                        ),
                        ListDetailsWidget('Want to Read', '15 Books'),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
