import 'package:flutter/material.dart';

class PostItem {
  final String userName;
  final String userImage;
  final String userPost;
  final String caption;
  final int likes;
  final int comments;
  final String gender;

  const PostItem({
    required this.userName,
    required this.userImage,
    required this.userPost,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.gender,
  });
}

class SocialFeedScreen extends StatelessWidget {
  final List<PostItem> posts;

  const SocialFeedScreen({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // =========================
        // SCROLLABLE CONTENT
        // =========================
        ListView.builder(
          padding: const EdgeInsets.fromLTRB(
            17,
            50,
            17,
            170,
          ),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // =========================
                  // USER HEADER
                  // =========================
                  Row(
                    children: [
                      // Profile image
                      ClipOval(
                        child: Image.asset(
                          'assets/images/profile_pic.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Name + gender icon
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.userName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF4D9A),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                post.gender.toLowerCase() == 'male'
                                    ? Icons.male
                                    : Icons.female,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Three dots
                      Row(
                        children: [
                          _buildDot(),
                          _buildDot(),
                          _buildDot(),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // =========================
                  // POST IMAGE
                  // =========================
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF00A8FF),
                        width: 3,
                      ),
                    ),
                    child: Image.network(
                      post.userPost,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // =========================
                  // CAPTION
                  // =========================
                  Text(
                    post.caption,
                    style: const TextStyle(
                      color: Color(0xFFD1C5D5),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // =========================
                  // LIKE + COMMENT
                  // =========================
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 28,
                      ),

                      const SizedBox(width: 12),

                      Text(
                        '${post.likes}',
                        style: const TextStyle(
                          color: Color(0xFFD1C5D5),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 22),

                      const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                        size: 24,
                      ),

                      const SizedBox(width: 12),

                      Text(
                        '${post.comments}',
                        style: const TextStyle(
                          color: Color(0xFFD1C5D5),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),

        // =========================
        // FIXED SAY HI + PLUS
        // =========================
        Positioned(
          right: 15,
          bottom: 48,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Say Hi action
                },
                child: Image.asset(
                  'assets/images/moment/say_hi.png',
                  width: 100,
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  // Plus action
                },
                child: Image.asset(
                  'assets/images/moment/plus.png',
                  width: 67,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      margin: const EdgeInsets.only(left: 7),
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}