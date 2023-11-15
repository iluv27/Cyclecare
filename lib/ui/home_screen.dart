// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:cyclecare/theme.dart';
import 'form_screen.dart';
import 'calender_screen.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const CalenderScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(bucket: bucket, child: currentScreen),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentScreen = const PeriodFormScreen();
            });
          },
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          child: const Icon(
            Icons.add,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 6,
          shape: const CircularNotchedRectangle(),
          color: const Color.fromARGB(255, 0, 0, 0),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Home Icon
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentScreen = const CalenderScreen();
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 25,
                      color: currentScreen.runtimeType == CalenderScreen
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 12,
                            color: currentScreen.runtimeType == CalenderScreen
                                ? AppColors.primaryColor
                                : Colors.white),
                      ),
                    )
                  ],
                ),
              ),

              //Add Icon
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 12,
                    color: currentScreen.runtimeType == PeriodFormScreen
                        ? AppColors.primaryColor
                        : Colors.white,
                  ),
                ),
              ),

              //Menu Icon
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentScreen = const DetailsScreen();
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 25,
                      color: currentScreen.runtimeType == DetailsScreen
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Text(
                        'Menu',
                        style: TextStyle(
                            fontSize: 12,
                            color: currentScreen.runtimeType == DetailsScreen
                                ? AppColors.primaryColor
                                : Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:cyclecare/theme.dart';
import 'form_screen.dart';
import 'calender_screen.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  List<Widget> screens = <Widget>[
    const CalenderScreen(),
    const PeriodFormScreen(),
    const DetailsScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const CalenderScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageStorage(bucket: bucket, child: currentScreen),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                currentScreen = const PeriodFormScreen();
              });
            },
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            elevation: 2,
            child: const Icon(
              Icons.add,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (index) {
              setState(() {
                currentPage = index;
              });
            },
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
          )),
    );
  }
}

*/