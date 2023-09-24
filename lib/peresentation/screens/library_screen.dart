import 'package:book_tracker/peresentation/widgets/list_tile_widget.dart';
import '../blocs/wantToReadBloc/want_to_read_bloc.dart';
import '/peresentation/blocs/wantToReadBloc/want_to_read_event.dart';
import '/peresentation/blocs/currentlyReadBloc/currently_read_bloc.dart';
import '/peresentation/blocs/currentlyReadBloc/currently_read_event.dart';
import '/peresentation/blocs/readBloc/read_event.dart';
import '/peresentation/widgets/search_bar.dart';
import '../blocs/wantToReadBloc/want_to_read_state.dart';
import '/data/datasource/api_handler.dart';
import '/data/repositories/books_repo.dart';
import '../blocs/currentlyReadBloc/currently_read_state.dart';
import '../blocs/readBloc/read_bloc.dart';
import '../blocs/readBloc/read_state.dart';
import '../prefs.dart';
import 'book_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibaryScreen extends StatefulWidget {
  const LibaryScreen({super.key});

  @override
  State<LibaryScreen> createState() => _LibaryScreenState();
}

class _LibaryScreenState extends State<LibaryScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<TokenProvider>().init(context);
    return LayoutBuilder(builder: (ctx, constraints) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ReadBloc(BooksRepositoryImp(ApiHandler())),
          ),
          BlocProvider(
            create: (context) =>
                CurrentlyReadBloc(BooksRepositoryImp(ApiHandler())),
          ),
          BlocProvider(
            create: (context) =>
                WantToReadBloc(BooksRepositoryImp(ApiHandler())),
          ),
        ],
        child: Column(
          children: [
            SearchBarWidget(_searchController),
            const SizedBox(height: 20,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    BlocListener<ReadBloc, ReadState>(
                      listener: (context, state) {
                        if (state is ReadSuccess) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return BookListScreen(state.books);
                            },
                          ));
                        }
                      },
                      child: BlocBuilder<ReadBloc, ReadState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<ReadBloc>(context)
                                  .add(SubmitReadEvent());
                            },
                            child: ListTileWidget('Read', constraints),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocListener<CurrentlyReadBloc, CurrentlyReadState>(
                      listener: (context, state) {
                        if (state is CurrentlyReadSuccess) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return BookListScreen(state.books);
                            },
                          ));
                        }
                      },
                      child: BlocBuilder<WantToReadBloc, WantToReadState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<WantToReadBloc>(context)
                                  .add(SubmitWantToReadEvent());
                            },
                            child: ListTileWidget('Want to Read', constraints),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocListener<WantToReadBloc, WantToReadState>(
                      listener: (context, state) {
                        if (state is WantToReadEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('snack'),
                          ));
                        }
                        if (state is WantToReadSuccess) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return BookListScreen(state.books);
                            },
                          ));
                        }
                      },
                      child: BlocBuilder<CurrentlyReadBloc, CurrentlyReadState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<CurrentlyReadBloc>(context)
                                  .add(SubmitCurrentlyReadEvent());
                            },
                            child: ListTileWidget(
                                'Currently Reading', constraints),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
