import '../peresentation/screens/auth_screen.dart';

import '../peresentation/screens/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'peresentation/prefs.dart';

void main() {
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
          primaryColor: Color.fromARGB(255, 2, 0, 136),
        ),
        home: AuthScreen(),
        routes: {
          TabsScreen.routeName: (ctx) => TabsScreen(),
        },
      ),
    );
  }
}
