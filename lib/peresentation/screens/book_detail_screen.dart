import '/data/datasource/api_handler.dart';
import '/data/repositories/books_repo.dart';
import '/peresentation/blocs/bookDetailBloc/book_detail_bloc.dart';
import '/peresentation/blocs/bookDetailBloc/book_detail_event.dart';
import '/peresentation/widgets/dropDownButton.dart';
import '/peresentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bookDetailBloc/book_detail_state.dart';

class BookDetailScreen extends StatefulWidget {
  static const routeName = '/book_detail_screen';
  int id;
  int index;
  String name;

  BookDetailScreen(this.id, this.index, this.name);

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double? _ratingValue;

    return LayoutBuilder(builder: (ctx, constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(widget.name),
        ),
        body: BlocProvider(
          create: (context) => BookDetailBloc(BooksRepositoryImp(ApiHandler()))
            ..add(SubmitBookEvent(widget.id)),
          child: SingleChildScrollView(
            child: BlocBuilder<BookDetailBloc, BookDetailState>(
              builder: (context, state) {
                if (state is BookDetailSuccess) {
                  return Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(226, 240, 240, 250),
                        ),
                        alignment: Alignment.center,
                        height: constraints.maxHeight * 0.36,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                          ),
                          child: Image.network(
                            state.books.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              state.books.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(' By ${state.books.author}'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.5,
                        child: DropDownButtonWidget([state.books.id]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RatingBarWidget((value) {
                        setState(() {
                          _ratingValue = value;
                        });
                      }),
                      const Text(
                        'My Rating',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                      const Text(
                        'Book Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.8,
                        child: Text(
                          state.books.description,
                          softWrap: true,
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      );
    });
  }
}
