import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final String systemTime;
  final String relationshipTime;
  final String reward_assistance;

  const MessageList({
    super.key,
    required this.systemTime,
    required this.relationshipTime,
    required this.reward_assistance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MessageItem(
          imagePath: 'assets/images/message/bell.png',
          title: 'System',
          subtitle: 'Celebrity agency',
          time: systemTime,
        ),

        const SizedBox(height: 28),

        _MessageItem(
          imagePath: 'assets/images/message/heart.png',
          title: 'Relationship',
          time: relationshipTime,
        ),

        const SizedBox(height: 28),

        _MessageItem(
          showPlaceholder: true,
          title: 'Reward Assistant',
          subtitle: 'Congrats On getting sign in Framex 1 Task',
          time: reward_assistance,
        ),

        const SizedBox(height: 70),

        Text(
          'All content Loaded',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.35),
          ),
        ),
      ],
    );
  }
}

class _MessageItem extends StatelessWidget {
  final String? imagePath;
  final bool showPlaceholder;
  final String title;
  final String? subtitle;
  final String time;

  const _MessageItem({
    this.imagePath,
    this.showPlaceholder = false,
    required this.title,
    this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image / placeholder
          if (showPlaceholder)
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                shape: BoxShape.circle,
              ),
            )
          else
            Image.asset(
              imagePath!,
              width: 56,
              height: 56,
              // fit: BoxFit.contain,
            ),

          const SizedBox(width: 12),

          // Title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.35),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Time
          Text(
            time,
            style: TextStyle(
              color: Colors.white.withOpacity(0.35),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}