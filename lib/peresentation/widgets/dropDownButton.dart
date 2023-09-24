import 'package:book_tracker/data/datasource/api_handler.dart';
import 'package:book_tracker/data/repositories/books_repo.dart';
import 'package:book_tracker/peresentation/blocs/currentlyReadBloc/currently_read_bloc.dart';
import 'package:book_tracker/peresentation/blocs/currentlyReadBloc/currently_read_event.dart';
import 'package:book_tracker/peresentation/blocs/readBloc/read_event.dart';
import 'package:book_tracker/peresentation/blocs/wantToReadBloc/want_to_read_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/readBloc/read_bloc.dart';
import '../blocs/readBloc/read_state.dart';
import '../blocs/wantToReadBloc/want_to_read_event.dart';

class DropDownButtonWidget extends StatefulWidget {
  List<int> id;
  DropDownButtonWidget(this.id);

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  var dropDownValue = 'Read';
  var items = [
    'Read',
    'Currently reading',
    'Want to read',
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReadBloc(BooksRepositoryImp(ApiHandler())),
        ),
        BlocProvider(
          create: (context) => WantToReadBloc(BooksRepositoryImp(ApiHandler())),
        ),
        BlocProvider(
          create: (context) =>
              CurrentlyReadBloc(BooksRepositoryImp(ApiHandler())),
        ),
      ],
      child: DropdownButtonFormField(
              elevation: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(83, 210, 221, 255),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              dropdownColor: const Color.fromARGB(255, 255, 255, 255),
              value: dropDownValue,
              icon: const Icon(Icons.arrow_drop_down_sharp),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropDownValue = newValue!;
                });
                if (newValue == 'Read') {
                  BlocProvider.of<ReadBloc>(context)
                      .add(AddReadEvent(widget.id));
                } else if (newValue == 'Currently reading') {
                  BlocProvider.of<CurrentlyReadBloc>(context)
                      .add(AddCurrentlyReadEvent(widget.id));
                } else if (newValue == 'Want to read') {
                  BlocProvider.of<WantToReadBloc>(context)
                      .add(AddWantToReadEvent(widget.id));
                }
              }),
        
      
    );
  }
}
