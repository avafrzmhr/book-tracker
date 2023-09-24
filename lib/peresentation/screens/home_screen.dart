import '/data/datasource/api_handler.dart';
import '/data/repositories/books_repo.dart';
import '/peresentation/blocs/allBooksBloc/get_books_bloc.dart';
import '/peresentation/blocs/allBooksBloc/get_books_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/allBooksBloc/get_books_state.dart';
import '../prefs.dart';
import '../widgets/book_shelves_image.dart';
import 'book_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<TokenProvider>().init(context);
    return BlocProvider(
      create: (context) => GetBooksBloc(BooksRepositoryImp(ApiHandler()))
        ..add(SubmitGetBooksEvent()),
      child: BlocBuilder<GetBooksBloc, GetBooksState>(
        builder: (context, state) {
          if (state is GetBooksSuccess) {
            return LayoutBuilder(builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                child: ListView.builder(
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BookDetailScreen(
                              state.books[index].id,
                              index,
                              state.books[index].name,
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
                                state.books[index].image,
                                constraints,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    state.books[index].name,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'by ${state.books[index].author}',
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
                                    '${state.books[index].pages} pages',
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
              );
            });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
