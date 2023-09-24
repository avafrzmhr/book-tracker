import '/peresentation/screens/discover_screen.dart';
import '/peresentation/screens/home_screen.dart';
import '/peresentation/screens/library_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs_screen';
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const LibaryScreen(),
        'title': 'Library',
      },
      {
        'page': const HomeScreen(),
        'title': 'Home',
      },
      {
        'page': DiscoverScreen(),
        'title': 'Discover',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 15,
        ),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.library_books),
            title: const Text('Library'),
            selectedColor: const Color.fromARGB(255, 0, 16, 135),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_filled),
            title: const Text("Home"),
            selectedColor: const Color.fromARGB(255, 0, 16, 135),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: const Color.fromARGB(255, 0, 16, 135),
          ),
        ],
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
      ),
    );
  }
}
