

import '../peresentation/screens/auth_screen.dart';
import '../peresentation/screens/book_detail_screen.dart';
import '../peresentation/screens/home_screen.dart';
import '../peresentation/screens/main_screen.dart';
import '../peresentation/screens/shelf_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'peresentation/prefs.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TokenProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Tracker',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 0, 3, 52),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 127, 140, 255),
          ),
          useMaterial3: true,
        ),
        home: AuthScreen(),
        routes: {
          // ShelfScreen.routename: (ctx) => ShelfScreen(),
          
          TabsScreen.routeName: (ctx) => TabsScreen(),
      
        },
      ),
    );
  }
}
