import 'package:flutter/material.dart';
import '../../data/model/book.dart';
import '../widgets/book_shelves_image.dart';
import 'book_detail_screen.dart';

class BookListScreen extends StatefulWidget {
  List<Books> books;

  BookListScreen(this.books);

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'books',
          ),
          backgroundColor: Theme.of(context).primaryColor,
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BookDetailScreen(
                        widget.books[index].id,
                        index,
                        widget.books[index].name,
                      );
                    },
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(82, 231, 235, 248),
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
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.books[index].name,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                fontSize: 12,
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
                              'You rated it 0',
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
