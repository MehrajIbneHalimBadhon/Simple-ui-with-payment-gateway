import 'package:bubble_navigation_bar/bubble_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui_project_in_learning_approach/main.dart';
import 'package:ui_project_in_learning_approach/my_ads.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final PageController pageController = PageController();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _index = pageController.page!.round();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          MyHomePage(),
          MyAds(),
          Center(
            child: Text(
              'Profile',
            ),
          ),
          Center(
            child: Text(
              'Settings',
            ),
          )
        ],
      ),
      bottomNavigationBar: BubbleNavigationBar(
        currentIndex: _index,
        // iconSize: 32,
        // padding: const EdgeInsets.symmetric(horizontal: 0),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.orange.shade200,
        // showSelectedLevel: false,
        onIndexChanged: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 20),
            curve: Curves.decelerate,
          );
        },
        items: const [
          BubbleNavItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BubbleNavItem(
            icon: Icon(Icons.shop_outlined),
            label: 'My Ads',
          ),
          BubbleNavItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BubbleNavItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
