import 'package:book_tracker/peresentation/screens/shelf_screen.dart';
import 'package:flutter/material.dart';

import '../../data/model/book.dart';
import '../widgets/book_shelves_image.dart';
import 'book_detail_screen.dart';

class SearchResultScreen extends StatefulWidget {
  List<Books> books;

  SearchResultScreen(this.books);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Results'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
          ),
          child: ListView.builder(
            itemCount: widget.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 236, 255),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    height: constraints.maxHeight * 0.2,
                    child: Row(
                      children: [
                        BookShelvesImage(
                          widget.books[index].image,
                          constraints,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.books[index].name,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'by ${widget.books[index].author}',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const Text(
                              'You rated it 3.5',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const Text(
                              'Published Date:',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${widget.books[index].pages} pages',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
