import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------
/// Nimo Voice Chat - Login Screen
/// ---------------------------------------------------------------------
/// Layer structure (bottom -> top), matching the screenshot:
///   1. Gradient background image asset - fills the entire screen
///      (assets/images/bg_gradient.png, BoxFit.cover)
///   2. Ruins/temple image - pinned to the top, full width, height
///      determined by the image's own fixed aspect ratio (NOT full
///      screen height, doesn't stretch/cover)
///   3. Main content column, on top of both background layers:
///        a. Single Nimo mascot + "NIMO VOICE CHAT" logo image
///           (one combined asset)
///        b. "Continue with Google" button
///        c. "Log in with ID" button
///        d. "OR" divider with lines
///        e. Circular phone icon button
///        f. Terms & Privacy Policy text with radio-style checkbox
///
/// Drop your real assets in and update the paths marked with TODO.
/// ---------------------------------------------------------------------

// void main() => runApp(const NimoApp());

class NimoLoginScreen extends StatefulWidget {
  final VoidCallback onHelp;
  final VoidCallback onGoogle;
  final VoidCallback onId;
  final VoidCallback onPhone;

  const NimoLoginScreen({
    super.key,
    required this.onHelp,
    required this.onGoogle,
    required this.onId,
    required this.onPhone,
  });

  @override
  State<NimoLoginScreen> createState() => _NimoLoginScreenState();
}

class _NimoLoginScreenState extends State<NimoLoginScreen> {
  bool _agreedToTerms = false;

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

          // --------------------------------------------------------
          // Foreground content (safe area + scroll for small screens)
          // --------------------------------------------------------
          SafeArea(
            child: Column(
              children: [
                // Help "?" icon, top-right
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, top: 8),
                    child: _HelpButton(onTap: widget.onHelp,),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),

                        // ------------------------------------------
                        // LAYER 3a: Single combined Nimo logo image
                        // (mascot + "NIMO VOICE CHAT" wordmark as
                        // ONE image asset, not separate pieces)
                        // ------------------------------------------
                        // TODO: replace this whole block with:
                        Image.asset('assets/images/login/cat.png'),

                        const SizedBox(height: 40),

                        // ------------------------------------------
                        // LAYER 4: Continue with Google button
                        // ------------------------------------------
                        _AuthButton(
                          onTap: () {
                            Navigator.pushNamed(context, '/mainApp');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // TODO: replace with real Google "G" logo asset
                              const SizedBox(width: 12),
                              Image.asset('assets/images/login/google.png', height: 49),
                              const SizedBox(width: 14),
                              const Text(
                                'Continue with Google',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ------------------------------------------
                        // LAYER 5: Log in with ID button
                        // ------------------------------------------
                        _AuthButton(
                          onTap: () {Navigator.pushNamed(context, '/mainApp');},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/login/id.png', height: 52,),
                              const SizedBox(width: 0),
                              const Text(
                                'Log in with ID',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 28),

                        // ------------------------------------------
                        // LAYER 6: OR divider
                        // ------------------------------------------
                        const _OrDivider(),

                        const SizedBox(height: 24),

                        // ------------------------------------------
                        // LAYER 7: Phone / alt login circular icon
                        // ------------------------------------------
                        _PhoneIconButton(onTap: widget.onPhone),

                        const SizedBox(height: 28),

                        // ------------------------------------------
                        // LAYER 8: Terms & Privacy Policy row
                        // ------------------------------------------
                        _TermsRow(
                          agreed: _agreedToTerms,
                          onChanged: (val) {
                            setState(() => _agreedToTerms = val);
                          },
                        ),

                        const SizedBox(height: 24),
                      ],
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
// Help "?" circular button, top right
// =============================================================
class _HelpButton extends StatelessWidget {
  final VoidCallback onTap;
  const _HelpButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/images/login/help.png',
        width: 32,
      ),
    );
  }
}

// =============================================================
// Reusable white pill-shaped auth button
// =============================================================
class _AuthButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const _AuthButton({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 58,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

// =============================================================
// "OR" divider with two horizontal lines
// =============================================================
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 3, color: Colors.white.withOpacity(0.5)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
        Expanded(
          child: Container(height: 3, color: Colors.white.withOpacity(0.5)),
        ),
      ],
    );
  }
}

// =============================================================
// Circular white phone icon button (alt login method)
// =============================================================
class _PhoneIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const _PhoneIconButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.phone_iphone_rounded,
          color: Color(0xFF6C4CE0),
          size: 28,
        ),
      ),
    );
  }
}

class _TermsRow extends StatelessWidget {
  final bool agreed;
  final ValueChanged<bool> onChanged;

  const _TermsRow({
    required this.agreed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => onChanged(!agreed),
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.4,
                  ),
                  color: agreed
                      ? Colors.white
                      : Colors.transparent,
                ),
                child: agreed
                    ? const Icon(
                  Icons.check,
                  size: 12,
                  color: Color(0xFF6C4CE0),
                )
                    : null,
              ),
            ),

            const SizedBox(width: 8),

            const Text(
              'I have read and agreed on',
              style: TextStyle(
                fontSize: 12.5,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ],
        ),

        const Text(
          'Nimo Voice Chat Terms of Service and Privacy policy',
          style: TextStyle(
            fontSize: 12.5,
            color: Colors.white,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}