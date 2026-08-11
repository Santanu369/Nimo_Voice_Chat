import 'package:flutter/material.dart';

/// --- Models ---
/// All lists below are passed in as arguments so this widget stays purely
/// presentational — the caller supplies the real data.

/// A stage/room card (Wealth / Charm / Game).
class StageItem {
  final String label;
  final String imagePath;

  const StageItem({required this.label, required this.imagePath});
}

/// A profile avatar shown in the horizontal scrollable list.
class ProfileItem {
  final String id;
  final String imagePath;

  const ProfileItem({required this.id, required this.imagePath});
}

/// A country flag chip shown in the horizontal scrollable list.
class CountryItem {
  final String code;
  final String flagImageUrl;

  const CountryItem({required this.code, required this.flagImageUrl});
}

/// A photo shown in the bottom vertical scrollable grid.
class PhotoItem {
  final String id;
  final String imageUrl;

  const PhotoItem({required this.id, required this.imageUrl});
}

/// The "Popular" screen content, matching the screenshot:
/// 1. Astrology banner image
/// 2. Three stage cards (Wealth / Charm / Game) with a label on each
/// 3. Horizontal scrollable row of profile avatars (circles)
/// 4. Fire-icon button + horizontal scrollable country flags + "more" arrow
/// 5. Vertical scrollable grid of photos
///
/// This widget does NOT include the background, ruins image, or top nav bar —
/// it's meant to be placed inside whatever container already provides those.
class PopularScreen extends StatelessWidget {
  final List<StageItem> stages = const [
    const StageItem(
      label: 'Wealth',
      imagePath: 'assets/images/home/popular/wealth.png',
    ),
    const StageItem(
      label: 'Charm',
      imagePath: 'assets/images/home/popular/charm.png',
    ),
    const StageItem(
      label: 'Game',
      imagePath: 'assets/images/home/popular/game.png',
    ),
  ];
  final List<ProfileItem> profiles = const [
    const ProfileItem(
      id: '1',
      imagePath: 'assets/images/profile_pic.png',
    ),
    const ProfileItem(
      id: '2',
      imagePath: 'assets/images/profile_pic.png',
    ),
    const ProfileItem(
      id: '3',
      imagePath: 'assets/images/profile_pic.png',
    ),
  ];
  final List<CountryItem> countries = const [
    const CountryItem(code: '1', flagImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT9jy7_mlARVy1h-jjPb2q-yARVUxFM6U4Bc9SKyHRhg&s=10',),
    const CountryItem(code: '1', flagImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT9jy7_mlARVy1h-jjPb2q-yARVUxFM6U4Bc9SKyHRhg&s=10',),
    const CountryItem(code: '1', flagImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT9jy7_mlARVy1h-jjPb2q-yARVUxFM6U4Bc9SKyHRhg&s=10',),
    const CountryItem(code: '1', flagImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT9jy7_mlARVy1h-jjPb2q-yARVUxFM6U4Bc9SKyHRhg&s=10',),
    const CountryItem(code: '1', flagImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT9jy7_mlARVy1h-jjPb2q-yARVUxFM6U4Bc9SKyHRhg&s=10',),
  ];
  final List<PhotoItem> photos = const [
    const PhotoItem(id: '1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-ht0HJRbtWycTAUdemSNVgDo8JcRg6oCB1nsTbb5QQ&s=10'),
    const PhotoItem(id: '1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-ht0HJRbtWycTAUdemSNVgDo8JcRg6oCB1nsTbb5QQ&s=10'),
    const PhotoItem(id: '1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-ht0HJRbtWycTAUdemSNVgDo8JcRg6oCB1nsTbb5QQ&s=10'),
    const PhotoItem(id: '1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-ht0HJRbtWycTAUdemSNVgDo8JcRg6oCB1nsTbb5QQ&s=10'),
    const PhotoItem(id: '1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-ht0HJRbtWycTAUdemSNVgDo8JcRg6oCB1nsTbb5QQ&s=10'),
    const PhotoItem(id: '1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-ht0HJRbtWycTAUdemSNVgDo8JcRg6oCB1nsTbb5QQ&s=10'),
    const PhotoItem(id: '1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-ht0HJRbtWycTAUdemSNVgDo8JcRg6oCB1nsTbb5QQ&s=10'),
    const PhotoItem(id: '1', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-ht0HJRbtWycTAUdemSNVgDo8JcRg6oCB1nsTbb5QQ&s=10'),
  ];
  final VoidCallback? onFireTap;
  final VoidCallback? onMoreCountriesTap;
  final ValueChanged<ProfileItem>? onProfileTap;
  final ValueChanged<StageItem>? onStageTap;
  final ValueChanged<PhotoItem>? onPhotoTap;

  const PopularScreen({
    super.key,
    this.onFireTap,
    this.onMoreCountriesTap,
    this.onProfileTap,
    this.onStageTap,
    this.onPhotoTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Everything above the photo grid is fixed content inside a single
        // sliver, so the whole screen scrolls as one (banner + stages +
        // avatars + flags scroll together with the photo grid below).
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),

                // 1) Astrology banner image
                Image.asset(
                    'assets/images/home/popular/astrology.png'
                ),

                const SizedBox(height: 16),

                // 2) Three stage cards: Wealth / Charm / Game
                Row(
                  children: [
                    for (int i = 0; i < stages.length; i++) ...[
                      // if (i != 0) const SizedBox(width: 5),
                      Expanded(
                        child: _StageCard(
                          item: stages[i],
                          onTap: () => onStageTap?.call(stages[i]),
                        ),
                      ),
                    ],
                  ],
                ),

                // const SizedBox(height: 16),

                // 3) Horizontal scrollable profile avatars
                SizedBox(
                  height: 64,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: profiles.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      final profile = profiles[index];
                      return GestureDetector(
                        onTap: () => onProfileTap?.call(profile),
                        child: CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(profile.imagePath),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // 4) Fire button + horizontal country flags + "more" arrow
                SizedBox(
                  height: 34,
                  child: Row(
                    children: [
                      // Fire button (fixed, not part of the scroll)
                      _FireButton(onTap: onFireTap),
                      const SizedBox(width: 10),

                      // Horizontal scrollable flags
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: countries.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final country = countries[index];

                            return SizedBox(
                              width: 50,
                              height: 20,
                              child: _FlagChip(item: country),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),

                      // "More countries" arrow button
                      _MoreArrowButton(onTap: onMoreCountriesTap),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),

        // 5) Vertical scrollable photo grid — part of the same scroll view.
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final photo = photos[index];
                return GestureDetector(
                  onTap: () => onPhotoTap?.call(photo),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      photo.imageUrl,
                      // fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              childCount: photos.length,
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class _StageCard extends StatelessWidget {
  final StageItem item;
  final VoidCallback onTap;

  const _StageCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Image.asset(
              item.imagePath,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    item.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FireButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _FireButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE5397A), Color(0xFF5B3FE0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24, width: 1.5),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.local_fire_department,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}

class _FlagChip extends StatelessWidget {
  final CountryItem item;

  const _FlagChip({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 44,
        height: 34,
        color: Colors.white10,
        child: Image.network(
          item.flagImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _MoreArrowButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _MoreArrowButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFF2C94C), width: 1.5),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.chevron_right,
          color: Color(0xFFF2C94C),
          size: 20,
        ),
      ),
    );
  }
}