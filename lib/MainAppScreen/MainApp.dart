import 'package:flutter/material.dart';

import 'Me_screen.dart';
import 'home/home_screen.dart';
import 'messages/message_main.dart';
import 'moment/main_moment_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen> {
  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    MomentMainScreen(),
    MessageMainScreen(),
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
            icon: SizedBox(
              height: 50,
              child: Center(
                child: AnimatedScale(
                  scale: selectedIndex == 0 ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    'assets/images/bottom_bar/home.png',
                    width: 65,
                  ),
                ),
              ),
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: SizedBox(
              height: 50,
              child: Center(
                child: AnimatedScale(
                  scale: selectedIndex == 1 ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    'assets/images/bottom_bar/moment.png',
                    width: 75,
                  ),
                ),
              ),
            ),
            label: 'Moment',
          ),

          BottomNavigationBarItem(
            icon: SizedBox(
              height: 50,
              child: Center(
                child: AnimatedScale(
                  scale: selectedIndex == 2 ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    'assets/images/bottom_bar/message.png',
                    width: 60,
                  ),
                ),
              ),
            ),
            label: 'Message',
          ),

          BottomNavigationBarItem(
            icon: SizedBox(
              height: 50,
              child: Center(
                child: AnimatedScale(
                  scale: selectedIndex == 3 ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/bottom_bar/me_ring_bg.png',
                        width: 50,
                      ),
                      Image.asset(
                        'assets/images/bottom_bar/me.png',
                        width: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}