import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// Profile Screen
/// ---------------------------------------------------------------------
/// Layer structure (bottom -> top), same background pattern as the
/// login screen:
///   1. Gradient background image asset - fills the entire screen
///   2. Ruins/temple image - pinned to the top, full width, height
///      follows the image's own fixed aspect ratio
///   3. Foreground content:
///        a. Top bar: edit icon (center), ID + copy icon (left),
///           avatar (right)
///        b. Country flag
///        c. Stats row: Followers / Following / Gifts / Visitors
///        d. VIP banner ("Upgrade Now" + medal image)
///        e. Coins card + Diamonds card
///        f. Quick action icons: Store / Task / Check in / Backpack
///        g. SCROLLABLE menu list: Agency Center, Host Center,
///           Cp space, My level, My Family, Badge, Feedback, Setting
///
/// All user-specific data (id, avatar, stats, coins, diamonds, flag,
/// menu items) is passed in via the constructor - nothing is hardcoded.
/// Every icon/graphic is loaded via Image.asset - swap the TODO paths
/// for your real asset files.
/// ---------------------------------------------------------------------

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: ProfileScreen(
        userId: '1182533',
        avatarImagePath: 'assets/images/avatar_placeholder.png',
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
      ),
    );
  }
}

/// Data model for a single row in the scrollable menu list
/// (Agency Center, Host Center, Cp space, etc.)
class MenuItemData {
  final String label;
  final String iconAssetPath;
  final VoidCallback onTap;

  const MenuItemData({
    required this.label,
    required this.iconAssetPath,
    required this.onTap,
  });

  /// Replace icon paths with your real assets and wire up real
  /// onTap callbacks (e.g. Navigator.push(...)) where you use this.
  static List<MenuItemData> defaultItems({
    VoidCallback? onAgencyCenter,
    VoidCallback? onHostCenter,
    VoidCallback? onCpSpace,
    VoidCallback? onMyLevel,
    VoidCallback? onMyFamily,
    VoidCallback? onBadge,
    VoidCallback? onFeedback,
    VoidCallback? onSetting,
  }) {
    return [
      MenuItemData(
        label: 'Agency Center',
        iconAssetPath: 'assets/images/me/agency_center.png',
        onTap: onAgencyCenter ?? () {},
      ),
      MenuItemData(
        label: 'Host Center',
        iconAssetPath: 'assets/images/me/host_center.png',
        onTap: onHostCenter ?? () {},
      ),
      MenuItemData(
        label: 'Cp space',
        iconAssetPath: 'assets/images/me/cp_space.png',
        onTap: onCpSpace ?? () {},
      ),
      MenuItemData(
        label: 'My level',
        iconAssetPath: 'assets/images/me/my_level.png',
        onTap: onMyLevel ?? () {},
      ),
      MenuItemData(
        label: 'My Family',
        iconAssetPath: 'assets/images/me/my_family.png',
        onTap: onMyFamily ?? () {},
      ),
      MenuItemData(
        label: 'Badge',
        iconAssetPath: 'assets/images/me/badge.png',
        onTap: onBadge ?? () {},
      ),
      MenuItemData(
        label: 'Feedback',
        iconAssetPath: 'assets/images/me/feedback.png',
        onTap: onFeedback ?? () {},
      ),
      MenuItemData(
        label: 'Setting',
        iconAssetPath: 'assets/images/me/settings.png',
        onTap: onSetting ?? () {},
      ),
    ];
  }
}

class ProfileScreen extends StatelessWidget {
  // -----------------------------------------------------------------
  // Everything below is passed in when the screen is called - no
  // values are hardcoded inside the widget.
  // -----------------------------------------------------------------
  final String userId;
  final String avatarImagePath; // network or asset path, see _AvatarImage
  final String countryFlagImagePath;

  final int followers;
  final int following;
  final int gifts;
  final int visitors;

  final int coins;
  final int diamonds;

  final VoidCallback onEditPressed;
  final VoidCallback onCopyIdPressed;
  final VoidCallback onAvatarPressed;
  final VoidCallback onUpgradePressed;
  final VoidCallback onCoinsPressed;
  final VoidCallback onDiamondsPressed;

  final VoidCallback? onStorePressed;
  final VoidCallback? onTaskPressed;
  final VoidCallback? onCheckInPressed;
  final VoidCallback? onBackpackPressed;

  final List<MenuItemData> menuItems;

  const ProfileScreen({
    super.key,
    required this.userId,
    required this.avatarImagePath,
    required this.countryFlagImagePath,
    required this.followers,
    required this.following,
    required this.gifts,
    required this.visitors,
    required this.coins,
    required this.diamonds,
    required this.onEditPressed,
    required this.onCopyIdPressed,
    required this.onAvatarPressed,
    required this.onUpgradePressed,
    required this.onCoinsPressed,
    required this.onDiamondsPressed,
    required this.menuItems,
    this.onStorePressed,
    this.onTaskPressed,
    this.onCheckInPressed,
    this.onBackpackPressed,
  });

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
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),

          // --------------------------------------------------------
          // LAYER 2: Ruins/temple image - top, full width, height
          // follows the image's own fixed aspect ratio
          // --------------------------------------------------------
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/login/bg_ruins.png', fit: BoxFit.fitWidth),
          ),

          // --------------------------------------------------------
          // Foreground content
          // --------------------------------------------------------
          SafeArea(
            child: Column(
              children: [
                // ---- Fixed (non-scrollable) top section ----
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  child: Column(
                    children: [
                      _TopBar(
                        userId: userId,
                        avatarImagePath: avatarImagePath,
                        onEditPressed: onEditPressed,
                        onCopyIdPressed: onCopyIdPressed,
                        onAvatarPressed: onAvatarPressed,
                      ),
                      const SizedBox(height: 10),
                      _CountryFlag(flagImagePath: countryFlagImagePath),
                      const SizedBox(height: 12),
                      _StatsRow(
                        followers: followers,
                        following: following,
                        gifts: gifts,
                        visitors: visitors,
                      ),
                      const SizedBox(height: 18),
                      _VipBanner(onUpgradePressed: onUpgradePressed),
                      const SizedBox(height: 16),
                      _CoinsAndDiamondsRow(
                        coins: coins,
                        diamonds: diamonds,
                        onCoinsPressed: onCoinsPressed,
                        onDiamondsPressed: onDiamondsPressed,
                      ),
                      const SizedBox(height: 16),
                      _QuickActionsRow(
                        onStorePressed: onStorePressed,
                        onTaskPressed: onTaskPressed,
                        onCheckInPressed: onCheckInPressed,
                        onBackpackPressed: onBackpackPressed,
                      ),
                    ],
                  ),
                ),

                // ---- SCROLLABLE menu section ----
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.18),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      itemCount: menuItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 4),
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        return _MenuRow(item: item);
                      },
                    ),
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

// =============================================================
// Top bar: ID + copy (left), edit icon (center), avatar (right)
// =============================================================
class _TopBar extends StatelessWidget {
  final String userId;
  final String avatarImagePath;
  final VoidCallback onEditPressed;
  final VoidCallback onCopyIdPressed;
  final VoidCallback onAvatarPressed;

  const _TopBar({
    required this.userId,
    required this.avatarImagePath,
    required this.onEditPressed,
    required this.onCopyIdPressed,
    required this.onAvatarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ID + copy icon
        Expanded(
          child: GestureDetector(
            onTap: onCopyIdPressed,
            child: Row(
              children: [
                Text(
                  'ID:$userId',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 6),
                // TODO: replace with Image.asset('assets/icons/copy.png', width: 14)
                const Icon(Icons.copy, color: Colors.white54, size: 14),
              ],
            ),
          ),
        ),

        // Edit icon, centered above avatar row
        InkWell(
          onTap: onEditPressed,
          child: const Padding(
            padding: EdgeInsets.all(6),
            // TODO: replace with Image.asset('assets/icons/edit.png', width: 20)
            child: Icon(Icons.edit_outlined, color: Colors.white, size: 20),
          ),
        ),

        const SizedBox(width: 8),

        // Avatar
        GestureDetector(
          onTap: onAvatarPressed,
          child: _AvatarImage(imagePath: avatarImagePath, size: 48),
        ),
      ],
    );
  }
}

/// Loads a network avatar if the path looks like a URL, otherwise
/// falls back to a local asset. Swap this logic for your own image
/// loading (e.g. CachedNetworkImage) as needed.
class _AvatarImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const _AvatarImage({required this.imagePath, required this.size});

  @override
  Widget build(BuildContext context) {
    final isNetwork = imagePath.startsWith('http');

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      clipBehavior: Clip.antiAlias,
      child: isNetwork
          ? Image.network(imagePath, fit: BoxFit.cover)
      // TODO: point to your real placeholder asset.
          : Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: const Color(0xFF6C4CE0),
          child: const Icon(Icons.person, color: Colors.white),
        ),
      ),
    );
  }
}

// =============================================================
// Country flag
// =============================================================
class _CountryFlag extends StatelessWidget {
  final String flagImagePath;
  const _CountryFlag({required this.flagImagePath});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        // TODO: replace with Image.asset(flagImagePath, width: 24, height: 16, fit: BoxFit.cover)
        child: Image.asset(flagImagePath, width: 24, height: 16, fit: BoxFit.cover)
      ),
    );
  }
}

// =============================================================
// Stats row: Followers / Following / Gifts / Visitors
// =============================================================
class _StatsRow extends StatelessWidget {
  final int followers;
  final int following;
  final int gifts;
  final int visitors;

  const _StatsRow({
    required this.followers,
    required this.following,
    required this.gifts,
    required this.visitors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _StatItem(label: 'Followers', value: followers),
        _StatItem(label: 'Following', value: following),
        _StatItem(label: 'Gifts', value: gifts),
        _StatItem(label: 'Visitors', value: visitors),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final int value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$value',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    );
  }
}

// =============================================================
// VIP banner: "Upgrade Now" pill + "VIP" wordmark + medal image
// =============================================================
class _VipBanner extends StatelessWidget {
  final VoidCallback onUpgradePressed;
  const _VipBanner({required this.onUpgradePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/me/vip_banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: onUpgradePressed,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/me/button.png',
                              width: 85,
                              height: 27,
                              fit: BoxFit.fill,
                            ),
                            const Text(
                              'Upgrade Now',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 11.5,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // TODO: replace with Image.asset('assets/images/vip_wordmark.png')
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/me/vip.png',
                            height: 42,
                          ),
                          const Text(
                            'Unlock Premium Experience',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Medal / badge image, right side
          Positioned(
            right: 32,
            top: 0,
            bottom: 0,
            child: Center(
              // TODO: replace with Image.asset('assets/images/vip_medal.png', width: 70)
              child: Image.asset('assets/images/me/badge.png', width: 65)
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// Coins + Diamonds cards
// =============================================================
class _CoinsAndDiamondsRow extends StatelessWidget {
  final int coins;
  final int diamonds;
  final VoidCallback onCoinsPressed;
  final VoidCallback onDiamondsPressed;

  const _CoinsAndDiamondsRow({
    required this.coins,
    required this.diamonds,
    required this.onCoinsPressed,
    required this.onDiamondsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ValueCard(
            label: 'coin',
            value: coins,
            // TODO: replace with Image.asset('assets/icons/coins.png', width: 40)
            icon: Icons.monetization_on,
            iconColor: const Color(0xFFFFD54F),
            gradientColors: const [Color(0xFFD9A441), Color(0xFF8A5A1E)],
            onTap: onCoinsPressed,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ValueCard(
            label: 'diamond',
            value: diamonds,
            // TODO: replace with Image.asset('assets/icons/diamonds.png', width: 40)
            icon: Icons.diamond,
            iconColor: const Color(0xFF7FD8F7),
            gradientColors: const [Color(0xFF9C7BE0), Color(0xFF6A4FCB)],
            onTap: onDiamondsPressed,
          ),
        ),
      ],
    );
  }
}

class _ValueCard extends StatelessWidget {
  final String label;
  final int value;
  final IconData icon;
  final Color iconColor;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const _ValueCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage(
            label == 'coin'
              ? 'assets/images/me/coin_bg.png'
              : 'assets/images/me/diamond_bg.png',),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 3,
            top: 0,
            child: Image.asset(
              label == 'coin'
              ? 'assets/images/me/coin_box.png'
              : 'assets/images/me/diamond.png',
              height: 59,
            ),
          ),

          Positioned(
            left: 12,
            top: 60,
            child: Text(
              '$value',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color:
                label == 'coin'
                  ? Color(0xffFEDD56)
                    : Color(0xffBE6CFD)
              ),
            )
          ),

          Positioned(
              left: 70,
              top: 18,
              child: Text(
                label == 'coin'
                    ? 'Coins'
                    : 'Diamonds',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.blueGrey
                ),
              )
          ),
        ],
      ),
    );
  }
}

// =============================================================
// Quick action icons row: Store / Task / Check in / Backpack
// =============================================================
class _QuickActionsRow extends StatelessWidget {
  final VoidCallback? onStorePressed;
  final VoidCallback? onTaskPressed;
  final VoidCallback? onCheckInPressed;
  final VoidCallback? onBackpackPressed;

  const _QuickActionsRow({
    this.onStorePressed,
    this.onTaskPressed,
    this.onCheckInPressed,
    this.onBackpackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.18),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _QuickAction(
            label: 'Store',
            // TODO: Image.asset('assets/icons/store.png')
            image_path: 'assets/images/me/store.png',
            iconBg: const Color(0xFF6C8CFF),
            onTap: onStorePressed,
          ),
          _QuickAction(
            label: 'Task',
            // TODO: Image.asset('assets/icons/task.png')
            image_path: 'assets/images/me/task.png',
            iconBg: const Color(0xFFFF8A65),
            onTap: onTaskPressed,
          ),
          _QuickAction(
            label: 'Check in',
            // TODO: Image.asset('assets/icons/checkin.png')
            image_path: 'assets/images/me/check_in.png',
            iconBg: const Color(0xFFFFB74D),
            onTap: onCheckInPressed,
          ),
          _QuickAction(
            label: 'Backpack',
            // TODO: Image.asset('assets/icons/backpack.png')
            image_path: 'assets/images/me/backpack.png',
            iconBg: const Color(0xFF64B5F6),
            onTap: onBackpackPressed,
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final String label;
  final String image_path;
  final Color iconBg;
  final VoidCallback? onTap;

  const _QuickAction({
    required this.label,
    required this.image_path,
    required this.iconBg,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            width: 46,
            height: 46,
            child: Image.asset(image_path),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// Single row in the scrollable menu list
// =============================================================
class _MenuRow extends StatelessWidget {
  final MenuItemData item;
  const _MenuRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            // Icon badge - swap for the real asset per row.
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.iconAssetPath,
                width: 34,
                height: 34,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 34,
                  height: 34,
                  color: const Color(0xFF6C4CE0),
                  child: const Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                item.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white54,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}