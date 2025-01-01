import 'package:e_com_app/view/cart/cart_screen.dart';
import 'package:e_com_app/view/favuorites/favourite_screen.dart';
import 'package:e_com_app/view/home_screen/home_screen.dart';
import 'package:e_com_app/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            activeIcon: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 128, 33, 243),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
            activeIcon: Icon(
              Icons.favorite,
              color: const Color.fromARGB(255, 128, 33, 243),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
            activeIcon: Icon(
              Icons.shopping_cart,
              color: const Color.fromARGB(255, 128, 33, 243),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
            activeIcon: Icon(
              Icons.person,
              color: const Color.fromARGB(255, 128, 33, 243),
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 128, 33, 243),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
      ),
    );
  }
}
