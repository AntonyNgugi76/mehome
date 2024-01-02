import 'package:flutter/material.dart';
import 'package:mehome/ui/home/dashboard.dart';
import 'package:mehome/utils/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool isTheme1 = true; // Track the current theme

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    Container(),
    Container(),
    Container(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width < 600;
    return screenSize
        ? Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: Container(height: MediaQuery.of(context).size.height*0.08,child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.home_filled,
                      color: AppColors().colorPrimary,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.add,
                      color: AppColors().colorPrimary,
                    ),
                    label: 'Add Property',
                    // backgroundColor: AppColors().colorWhite
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.chat_bubble_outline,
                      color: AppColors().colorPrimary,
                    ),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_rounded,
                      color: Colors.grey,
                    ),
                    activeIcon: Icon(
                      Icons.person_rounded,
                      color: AppColors().colorPrimary,
                    ),
                    label: 'Profile',
                  ),
                ],
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.white,
                currentIndex: _selectedIndex,
                selectedItemColor: AppColors().colorPrimary,
                iconSize: 25,
                onTap: _onItemTapped,
                elevation: 5),
            ))
        : Container();
  }
}
