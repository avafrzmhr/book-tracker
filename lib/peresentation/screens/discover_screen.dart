import 'package:book_tracker/peresentation/screens/search_result_screen.dart';

import '/data/datasource/api_handler.dart';
import '/data/repositories/books_repo.dart';
import '/peresentation/blocs/searchBloc/search_event.dart';
import 'package:flutter/src/widgets/framework.dart';


import '/peresentation/widgets/genre_grids.dart';
import '/peresentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/searchBloc/search_bloc.dart';
import '../blocs/searchBloc/search_state.dart';
import '../prefs.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    context.read<TokenProvider>().init(context);
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
          children: [
           SearchBarWidget(_searchController),
    
              
            
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 15,
                ),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                ),
                children: [
                  GenreGrids(constraints, '1'),
                  GenreGrids(constraints, '2'),
                  GenreGrids(constraints, '3'),
                  GenreGrids(constraints, '4'),
                  GenreGrids(constraints, '5'),
                  GenreGrids(constraints, '6'),
                ],
              ),
            ),
          ],
        
      );
    });
  }
}
