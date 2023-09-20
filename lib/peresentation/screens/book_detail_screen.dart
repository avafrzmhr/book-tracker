import 'package:book_tracker/peresentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget {
  static const routeName = '/book_detail_screen';

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double? _ratingValue;
    var dropDownValue = 'Read';
    var items = [
      'Read',
      'Currently reading',
      'Want to read',
    ];
    return LayoutBuilder(builder: (ctx, constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Milk and Honey'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: constraints.maxHeight * 0.36,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                  ),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black12,
              ),
              const Center(
                child: Text(
                  'Milk and Honey \n\t By rupi kaur',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black12,
              ),
              Container(
                width: constraints.maxWidth * 0.5,
                child: DropdownButtonFormField(
                    elevation: 1,
                    decoration: InputDecoration(
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
                    }),
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
                child: const Text(
                    "The book is divided into four chapters, and each chapter serves a different purpose.\n Deals with a different pain. Heals a different heartache.\n Milk and Honey takes readers through a journey of the most bitter moments in life and finds sweetness in them because there is sweetness everywhere if you are just willing to look."),
              )
            ],
          ),
        ),
      );
    });
  }
}
