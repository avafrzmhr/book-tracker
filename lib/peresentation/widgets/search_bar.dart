import 'package:book_tracker/data/datasource/api_handler.dart';
import 'package:book_tracker/data/repositories/books_repo.dart';
import 'package:book_tracker/peresentation/blocs/searchBloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/searchBloc/search_event.dart';
import '../blocs/searchBloc/search_state.dart';
import '../screens/book_list_screen.dart';

class SearchBarWidget extends StatelessWidget {
  TextEditingController searchController;

  SearchBarWidget(
    this.searchController,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return BlocProvider(
        create: (context) => SearchBloc(BooksRepositoryImp(ApiHandler())),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocListener<SearchBloc, SearchState>(
            listener: (context, state) {
              if (state is SearchSuccess) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BookListScreen(state.books);
                  },
                ));
              }
            },
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return Container(
                  width: constraints.maxWidth * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xFFe9eaec),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    cursorColor: const Color(0xFF000000),
                    controller: searchController,
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<SearchBloc>(context)
                                .add(SubmitSearchEvent(searchController.text));
                          },
                          icon: const Icon(Icons.search),
                          color: const Color(0xFF000000).withOpacity(0.5),
                        ),
                        hintText: "Search",
                        border: InputBorder.none),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
