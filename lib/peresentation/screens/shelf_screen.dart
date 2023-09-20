import 'package:book_tracker/peresentation/screens/book_detail_screen.dart';
import 'package:book_tracker/peresentation/widgets/book_shelves_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShelfScreen extends StatelessWidget {
  static const routename = '/shelf_screen';
  String imgUrl;
  String name;
  String author;
  int pages;

  ShelfScreen(this.imgUrl,this.name, this.author, this.pages);

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
          child: 
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(BookDetailScreen.routeName);
                },
                child: Row(
                  children: [
                    BookShelvesImage(imgUrl,constraints),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(name),
                        Text('by $author'),
                        Text('You rated it 3.5'),
                        Text('Published Date:'),
                        Text('$pages pages'),
                      ],
                    ),
                  ],
                ),
              ),
             
         
        ),
      );
    });
  }
}
