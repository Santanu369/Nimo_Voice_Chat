import 'package:flutter/material.dart';

import 'Me_screen.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen> {
  int selectedIndex = 4;

  final screens = [
    HomeScreen(),
    const Center(child: Text('Comming Soon..')),
    const Center(child: Text('Comming Soon..')),
    const Center(child: Text('Comming Soon..')),
    ProfileScreen(
      userId: '1182533',
      avatarImagePath: 'assets/images/profile_pic.png',
      countryFlagImagePath: 'assets/images/me/flag_india.png',
      followers: 0,
      following: 0,
      gifts: 0,
      visitors: 0,
      coins: 100,
      diamonds: 1,
      onEditPressed: () {},
      onCopyIdPressed: () {},
      onAvatarPressed: () {},
      onUpgradePressed: () {},
      onCoinsPressed: () {},
      onDiamondsPressed: () {},
      menuItems: MenuItemData.defaultItems(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff3C0061),

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,

        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bottom_bar/home.png', width: 50,),
            label: 'Home',
          ),
          
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bottom_bar/moment.png', width: 50),
            label: 'Moment',
          ),
          
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bottom_bar/room.png', width: 63),
            label: 'Voice Room',
          ),
          
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bottom_bar/message.png', width: 50),
            label: 'Message',
          ),
          
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bottom_bar/me.png', width: 50),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}