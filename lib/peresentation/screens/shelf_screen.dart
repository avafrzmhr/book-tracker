import 'package:book_tracker/peresentation/screens/book_detail_screen.dart';
import 'package:book_tracker/peresentation/widgets/book_shelves.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShelfScreen extends StatelessWidget {
  static const routename = '/shelf_screen';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Read'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 10,
          ),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(BookDetailScreen.routeName);
                },
                child: Row(
                  children: [
                    BookShelves(constraints),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: const [
                        Text('Milk and Honey'),
                        Text('by rupi kaur'),
                        Text('You rated it 3.5'),
                        Text('Published Date:'),
                        Text('200 pages'),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              Row(
                children: [
                  BookShelves(constraints),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: const [
                      Text('Milk and Honey'),
                      Text('by rupi kaur'),
                      Text('You rated it 3.5'),
                      Text('Published Date:'),
                      Text('200 pages'),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Colors.black26,
              ),
              Row(
                children: [
                  BookShelves(constraints),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: const [
                      Text('Milk and Honey'),
                      Text('by rupi kaur'),
                      Text('You rated it 3.5'),
                      Text('Published Date:'),
                      Text('200 pages'),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Colors.black26,
              ),
              Row(
                children: [
                  BookShelves(constraints),
                  const Divider(
                    color: Colors.black26,
                  ),
                  Column(
                    children: const [
                      Text('Milk and Honey'),
                      Text('by rupi kaur'),
                      Text('You rated it 3.5'),
                      Text('Published Date:'),
                      Text('200 pages'),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Colors.black26,
              ),
              Row(
                children: [
                  BookShelves(constraints),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: const [
                      Text('Milk and Honey'),
                      Text('by rupi kaur'),
                      Text('You rated it 3.5'),
                      Text('Published Date:'),
                      Text('200 pages'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
