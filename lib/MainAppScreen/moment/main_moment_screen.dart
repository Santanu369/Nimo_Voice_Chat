import 'package:flutter/material.dart';

import 'moment_screen_navigation.dart';
import 'online_screen.dart';

/// Which of the three top tabs is active.
enum MessageTab { moment, online}

/// Top section of the Astrology screen:
/// - Fixed purple gradient background (fills the screen, doesn't scroll/resize oddly)
/// - "Ruins" decorative image layered above the background
/// - Nav bar (Mine / Popular / Discover) + small icon button + search button
/// - Swaps the body content below the nav bar depending on the selected tab
class MomentMainScreen extends StatefulWidget {
  const MomentMainScreen({super.key});

  @override
  State<MomentMainScreen> createState() => _MomentMainScreenState();
}

class _MomentMainScreenState extends State<MomentMainScreen> {
  // Popular is selected by default, matching the screenshot.
  MessageTab _selectedTab = MessageTab.moment;

  void _onTabSelected(MessageTab tab) {
    if (tab == _selectedTab) return;
    setState(() => _selectedTab = tab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // --------------------------------------------------------
          // LAYER 1: Gradient background image asset - fills screen
          // --------------------------------------------------------
          // TODO: replace with your real gradient background asset.
          Image.asset('assets/images/login/bg.png', fit: BoxFit.cover),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF2B1B4A),
                  Color(0xFF1B1030),
                  Color(0xFF0F0821),
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // --------------------------------------------------------
          // LAYER 2: Ruins/temple image - top, full width, height
          // follows the image's own fixed aspect ratio (does NOT
          // cover/stretch to fill the screen)
          // --------------------------------------------------------
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/login/bg_ruins.png', fit: BoxFit.fitWidth),
          ),

          // 3) Nav bar (fixed) + body content that changes per tab.
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: _TopNavBar(
                    selectedTab: _selectedTab,
                    onTabSelected: _onTabSelected,
                  ),
                ),
                // Everything under the nav bar swaps based on the tab.
                // IndexedStack keeps each tab's scroll position/state alive
                // instead of rebuilding it from scratch every time you switch.
                Expanded(
                  child: IndexedStack(
                    index: _selectedTab.index,
                    children: const [
                      moment_screen_navigation(),
                      SocialFeedScreenOnline(
                          posts:
                          [
                            PostItem(userName: 'userName',
                                userImage: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
                                userPost: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEuu7b9gRbMktnkCLh3TxaucPDb_cNVp3QqdPKpd6mZA&s=10',
                                caption: 'caption',
                                likes: 10,
                                comments: 2,
                                gender: 'male'),

                            PostItem(userName: 'userName',
                                userImage: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
                                userPost: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEuu7b9gRbMktnkCLh3TxaucPDb_cNVp3QqdPKpd6mZA&s=10',
                                caption: 'caption',
                                likes: 10,
                                comments: 2,
                                gender: 'male'),
                          ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopNavBar extends StatelessWidget {
  final MessageTab selectedTab;
  final ValueChanged<MessageTab> onTabSelected;

  const _TopNavBar({required this.selectedTab, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Nav tabs: Mine / Popular / Discover
        SizedBox(
          width: 300,
          child: Row(
            children: [
              _NavTab(
                label: 'Moment',
                selected: selectedTab == MessageTab.moment,
                onTap: () => onTabSelected(MessageTab.moment),
              ),
              const SizedBox(width: 24),
              _NavTab(
                label: 'Online',
                selected: selectedTab == MessageTab.online,
                onTap: () => onTabSelected(MessageTab.online),
              ),
            ],
          ),
        ),

        // Small button/image beside the nav
        SizedBox(width: 28,),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/images/moment/golden_bell.png',
            width: 35,
            height: 35,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

class _NavTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.white.withOpacity(0.55),
              fontSize: 20,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 0),
          // White underline only for the selected tab
          Image.asset('assets/images/message/underline_decor.png',
            width: selected ? 106 : 0,)

          // Container(
          //   height: 3,
          //   width: selected ? 26 : 0,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(2),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const _RoundIconButton({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 38,
        height: 38,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}

/// --- Per-tab screens ---
/// Replace the bodies below with the real banner / cards / circles / flags /
/// grid content for each tab. Kept as simple placeholders here since only
/// the nav bar + tab-switching behavior was requested.

class _MineScreen extends StatelessWidget {
  const _MineScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Mine',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class _PopularScreen extends StatelessWidget {
  const _PopularScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Popular',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class _DiscoverScreen extends StatelessWidget {
  const _DiscoverScreen();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Coming Soon...',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}