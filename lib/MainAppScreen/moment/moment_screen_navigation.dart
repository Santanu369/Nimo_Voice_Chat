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
                      userImage: 'data:image/jpeg;base64,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',
                      userPost: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEuu7b9gRbMktnkCLh3TxaucPDb_cNVp3QqdPKpd6mZA&s=10',
                      caption: 'caption',
                      likes: 10,
                      comments: 2,
                      gender: 'male'),

                  PostItem(userName: 'userName',
                      userImage: 'data:image/jpeg;base64,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',
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