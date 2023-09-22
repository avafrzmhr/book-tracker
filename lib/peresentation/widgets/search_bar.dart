import 'package:book_tracker/data/datasource/api_handler.dart';
import 'package:book_tracker/data/repositories/books_repo.dart';
import 'package:book_tracker/peresentation/blocs/searchBloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/searchBloc/search_event.dart';
import '../blocs/searchBloc/search_state.dart';
import '../screens/search_result_screen.dart';

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
                    return SearchResultScreen(state.books);
                  },
                ));
              }
            },
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return Container(
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
                        onPressed:  () {
                          BlocProvider.of<SearchBloc>(context)
                        .add(SubmitSearchEvent(searchController.text));
                        }
                      ),
                    ),
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
