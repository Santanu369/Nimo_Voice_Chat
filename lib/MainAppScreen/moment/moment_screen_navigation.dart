import 'package:flutter/material.dart';

import 'recommended_screen.dart';

class moment_screen_navigation extends StatefulWidget {
  const moment_screen_navigation({super.key});

  @override
  State<moment_screen_navigation> createState() =>
      _moment_screen_navigationState();
}

class _moment_screen_navigationState
    extends State<moment_screen_navigation> {
  int selectedIndex = 1;

  final List<String> tabs = [
    'Follow',
    'Recommend',
    'Latest',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TOP NAVIGATION
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          child: Row(
            children: List.generate(
              tabs.length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == tabs.length - 1 ? 0 : 34,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tabs[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.55),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 7),

                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 3,
                        width: selectedIndex == index ? 73 : 0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // DUMMY SCREEN
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: const [
              FollowDummyScreen(),
              SocialFeedScreen(
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
              LatestDummyScreen(),
            ],
          ),
        ),
      ],
    );
  }
}

class FollowDummyScreen extends StatelessWidget {
  const FollowDummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DummyContent(
      title: 'Follow Screen',
      color: Colors.blue,
    );
  }
}

class RecommendDummyScreen extends StatelessWidget {
  const RecommendDummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DummyContent(
      title: 'Recommend Screen',
      color: Colors.purple,
    );
  }
}

class LatestDummyScreen extends StatelessWidget {
  const LatestDummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DummyContent(
      title: 'Latest Screen',
      color: Colors.orange,
    );
  }
}

class DummyContent extends StatelessWidget {
  final String title;
  final Color color;

  const DummyContent({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.layers_rounded,
            size: 80,
            color: color,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Coming soon...',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}