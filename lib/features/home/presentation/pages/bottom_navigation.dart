import 'package:demoproject/features/home/presentation/pages/cart_page.dart';
import 'package:demoproject/features/home/presentation/pages/home_page.dart';
import 'package:demoproject/features/learnings/presentation/pages/learning_page.dart';
import 'package:demoproject/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),        
    const AddToCartPAge(),  
    const LearningPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
       bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap:(index) {
          setState(() {
            _selectedIndex = index; 
          });
        },

      
          items: const [
      
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "home",
            
            ),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
            label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),
            label: "order"),
            BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "profile"),
      
          ]
          ),
    );
  }
}