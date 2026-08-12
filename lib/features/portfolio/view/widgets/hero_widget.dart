import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../util/app_images/app_images.dart';
import '../../../../util/helper/responsive_helper.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';

class HeroWidget extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  HeroWidget({super.key});

  final List<Map<String, dynamic>> phoneThemes = [
    {
      "name": "Teal & Indigo",
      "accent": const Color(0xFF2DD4BF),
      "glow": const Color(0xFF6366F1),
      "gradient": [const Color(0xFF0F172A), const Color(0xFF1E1B4B)],
      "codeColor": const Color(0xFF34D399),
      "colorCircle": const Color(0xFF1E1B4B),
    },
    {
      "name": "Emerald & Mint",
      "accent": const Color(0xFF10B981),
      "glow": const Color(0xFF059669),
      "gradient": [const Color(0xFF064E3B), const Color(0xFF022C22)],
      "codeColor": const Color(0xFF34D399),
      "colorCircle": const Color(0xFF10B981),
    },
    {
      "name": "Sunset Orange",
      "accent": const Color(0xFFF97316),
      "glow": const Color(0xFFEA580C),
      "gradient": [const Color(0xFFF97316), const Color(0xFF441f0f)],
      "codeColor": const Color(0xFFF43F5E),
      "colorCircle": const Color(0xFFF97316),
    },
    {
      "name": "Orchid Violet",
      "accent": const Color(0xFFD946EF),
      "glow": const Color(0xFF9333EA),
      "gradient": [const Color(0xFFD946EF), const Color(0xFF1E1B4B)],
      "codeColor": const Color(0xFFA855F7),
      "colorCircle": const Color(0xFFD946EF),
    },
  ];

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch $urlString");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final paddingX = ResponsiveHelper.responsiveSize(
      context,
      mobile: 20.0,
      tablet: 40.0,
      desktop: 80.0,
    );

    return Obx(() {
      final activeThemeIdx = controller.phoneThemeIndex.value;
      final currentTheme = phoneThemes[activeThemeIdx];
      final accentColor = currentTheme["accent"] as Color;

      return Container(
        key: controller.homeKey,
        color: const Color(0xFF030712), // Deep Slate dark background
        padding: EdgeInsets.symmetric(
          horizontal: paddingX,
          vertical: isMobile ? 60.0 : 80.0,
        ),
        child: isMobile || isTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAvatar(context, accentColor),
                  const SizedBox(height: 40.0),
                  _buildTextContent(context, true, accentColor),
                  const SizedBox(height: 48.0),
                  _buildCodeEditor(context),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 11,
                      child: _buildTextContent(context, false, accentColor)),
                  const SizedBox(width: 48.0),
                  Expanded(flex: 9, child: _buildCodeEditor(context)),
                ],
              ),
      );
    });
  }

  Widget _buildTextContent(
      BuildContext context, bool isCentered, Color accentColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (!isCentered) ...[
          _buildAvatar(context, accentColor),
          const SizedBox(height: 28.0),
        ],
        // Welcome tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: accentColor.withValues(alpha: 0.3),
              width: 1.0,
            ),
          ),
          child: Text(
            "👋 Welcome to my portfolio",
            style: AppTextStyle.style(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: accentColor,
            ),
          ),
        ),
        const SizedBox(height: 24.0),

        // Title
        RichText(
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
          text: TextSpan(
            style: AppTextStyle.style(
              fontSize: ResponsiveHelper.responsiveSize(context,
                  mobile: 36.0, tablet: 48.0, desktop: 52.0),
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.2,
            ),
            children: [
              const TextSpan(text: "Hi, I'm "),
              TextSpan(
                text: "Nahin\n",
                style: TextStyle(
                  color: accentColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),

        // Typewriter Text
        TypewriterText(
          key: ValueKey(accentColor), // restart animation with new theme color
          texts: const [
            "Flutter Developer",
            "Problem Solver",
            "Clam Under Pressure",
            "Fast Learner",
          ],
          style: AppTextStyle.style(
            fontSize: ResponsiveHelper.responsiveSize(context,
                mobile: 22.0, tablet: 28.0, desktop: 32.0),
            fontWeight: FontWeight.w700,
            color: accentColor,
          ),
        ),
        const SizedBox(height: 20.0),

        // Description
        Text(
          "I specialize in crafting premium-grade mobile applications and scalable cross-platform solutions. With 2+ years of experience integrating REST APIs, State Management, Stripe payments, and AI capabilities (Gemini LLM) using clean, maintainable architecture.",
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
          style: AppTextStyle.style(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF94A3B8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 36.0),

        // Action buttons
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          alignment: isCentered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => controller.scrollToSection(
                  controller.projectsKey, 'Projects'),
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: const Color(0xFF030712),
                padding: const EdgeInsets.symmetric(
                    horizontal: 28.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0.0,
              ).copyWith(
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return accentColor.withValues(alpha: 0.8);
                    }
                    return null;
                  },
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View My Work",
                    style: AppTextStyle.style(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF030712),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(Icons.arrow_forward_rounded, size: 18.0),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () =>
                  controller.scrollToSection(controller.contactKey, 'Contact'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF1E293B), width: 1.5),
                padding: const EdgeInsets.symmetric(
                    horizontal: 28.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ).copyWith(
                side: WidgetStateProperty.resolveWith<BorderSide?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return BorderSide(color: accentColor, width: 1.5);
                    }
                    return null;
                  },
                ),
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return const Color(0xFF1E293B);
                    }
                    return null;
                  },
                ),
              ),
              child: Text(
                "Contact Me",
                style: AppTextStyle.style(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, Color accentColor) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final avatarSize = ResponsiveHelper.responsiveSize(
      context,
      mobile: 180.0,
      tablet: 220.0,
      desktop: 160.0,
    );

    return Align(
      alignment: (isMobile || isTablet) ? Alignment.center : Alignment.centerLeft,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Glowing backdrop
          Container(
            width: avatarSize + 15.0,
            height: avatarSize + 15.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  accentColor.withValues(alpha: 0.4),
                  const Color(0xFF6366F1).withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.25),
                  blurRadius: 40.0,
                  spreadRadius: 8.0,
                ),
              ],
            ),
          ),
          Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF0F172A),
              border: Border.all(
                color: accentColor.withValues(alpha: 0.6),
                width: 3.0,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                AppImages.jubaerPhoto,
                width: avatarSize,
                height: avatarSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.person_rounded,
                    size: avatarSize * 0.5,
                    color: accentColor,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeEditor(BuildContext context) {
    return Obx(() {
      final activeThemeIdx = controller.phoneThemeIndex.value;
      final currentTheme = phoneThemes[activeThemeIdx];
      final accentColor = currentTheme["accent"] as Color;
      final gradientColors = currentTheme["gradient"] as List<Color>;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Realistic phone container frame
          Container(
            width: 320.0,
            height: 580.0,
            decoration: BoxDecoration(
              color: const Color(0xFF020712), // Outer device frame color
              borderRadius: BorderRadius.circular(44.0),
              border: Border.all(
                  color: const Color(0xFF1E293B), width: 12.0), // Bezel
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.15),
                  blurRadius: 30.0,
                  spreadRadius: 4.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Stack(
                children: [
                  // Phone screen content with swipeable pageview
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Status bar layout spacer
                        const SizedBox(height: 12.0),
                        _buildStatusBar(),
                        const SizedBox(height: 16.0),

                        // Swipeable PageView screen content
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: MouseDragScrollBehavior(),
                            child: PageView(
                              controller: controller.phonePageController,
                              onPageChanged: (pageIdx) {
                                controller.phonePageIndex.value = pageIdx;
                              },
                              children: [
                                // Page 1: iOS Apps Dashboard
                                _buildHomeScreenPage(context, accentColor),

                                // Page 2: Dart code viewer page
                                _buildCodeViewerPage(
                                    context, accentColor, currentTheme),
                              ],
                            ),
                          ),
                        ),

                        // Swipable indicators dots
                        _buildPageIndicators(),
                        const SizedBox(height: 16.0),

                        // Bottom Static Dock Bar
                        _buildDockBar(accentColor),

                        // Space under dock for indicator
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),

                  // iOS Dynamic Island Mockup
                  Positioned(
                    top: 10.0,
                    left: 0.0,
                    right: 0.0,
                    child: Center(
                      child: Container(
                        width: 90.0,
                        height: 22.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          controller.phonePageIndex.value == 0 ? "Home" : "IDE",
                          style: AppTextStyle.style(
                            fontSize: 9.0,
                            fontWeight: FontWeight.w700,
                            color: accentColor.withValues(alpha: 0.9),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // iOS Home Indicator Line
                  Positioned(
                    bottom: 6.0,
                    left: 0.0,
                    right: 0.0,
                    child: Center(
                      child: Container(
                        width: 110.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF64748B).withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          // Wallpaper & Accent Theme Switcher
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(phoneThemes.length, (idx) {
              final theme = phoneThemes[idx];
              final isSelected = activeThemeIdx == idx;
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => controller.phoneThemeIndex.value = idx,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: isSelected ? 26.0 : 18.0,
                    height: isSelected ? 26.0 : 18.0,
                    decoration: BoxDecoration(
                      color: theme["colorCircle"] as Color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: Colors.white, width: 2.5)
                          : Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                              width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: (theme["colorCircle"] as Color)
                              .withValues(alpha: 0.4),
                          blurRadius: isSelected ? 8.0 : 3.0,
                          spreadRadius: isSelected ? 1.0 : 0.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      );
    });
  }

  Widget _buildStatusBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DynamicPhoneClock(isMini: true),
          const Row(
            children: [
              Icon(Icons.signal_cellular_4_bar_rounded,
                  color: Colors.white, size: 12.0),
              SizedBox(width: 4.0),
              Icon(Icons.wifi_rounded, color: Colors.white, size: 12.0),
              SizedBox(width: 4.0),
              Icon(Icons.battery_full_rounded, color: Colors.white, size: 14.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHomeScreenPage(BuildContext context, Color accentColor) {
    return Column(
      children: [
        // Digital clock and date widget - dynamic clock!
        const DynamicPhoneClock(isMini: false),
        const SizedBox(height: 48.0),

        // Developer Card
        // Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 20.0),
        //   padding: const EdgeInsets.all(14.0),
        //   decoration: BoxDecoration(
        //     color: Colors.white.withValues(alpha: 0.08),
        //     borderRadius: BorderRadius.circular(16.0),
        //     border: Border.all(
        //       color: Colors.white.withValues(alpha: 0.15),
        //       width: 1.0,
        //     ),
        //   ),
        //   child: Row(
        //     children: [
        //       Container(
        //         padding: const EdgeInsets.all(8.0),
        //         decoration: BoxDecoration(
        //           color: accentColor.withValues(alpha: 0.15),
        //           shape: BoxShape.circle,
        //         ),
        //         child: Icon(
        //           Icons.bolt_rounded,
        //           color: accentColor,
        //           size: 22.0,
        //         ),
        //       ),
        //       const SizedBox(width: 12.0),
        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "Jubaer Islam Nahin",
        //               style: AppTextStyle.style(
        //                 fontSize: 13.0,
        //                 fontWeight: FontWeight.w700,
        //                 color: Colors.white,
        //               ),
        //             ),
        //             const SizedBox(height: 2.0),
        //             Text(
        //               "Flutter Developer",
        //               style: AppTextStyle.style(
        //                 fontSize: 10.5,
        //                 fontWeight: FontWeight.w600,
        //                 color: accentColor,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(height: 28.0),

        // Social Apps Grid (functioning buttons!)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAppIcon(
                    icon: Icons.code_rounded,
                    label: "GitHub",
                    color: const Color(0xFF1E293B),
                    url: "https://github.com/JubaerNahin",
                  ),
                  _buildAppIcon(
                    icon: Icons.business_center_rounded,
                    label: "LinkedIn",
                    color: const Color(0xFF0077B5),
                    url: "https://linkedin.com/in/jubaerislamnahin",
                  ),
                  _buildAppIcon(
                    icon: Icons.chat_bubble_outline_rounded,
                    label: "WhatsApp",
                    color: const Color(0xFF25D366),
                    url: "https://wa.me/8801978581747",
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAppIcon(
                    icon: Icons.facebook_rounded,
                    label: "Facebook",
                    color: const Color(0xFF1877F2),
                    url: "https://www.facebook.com/jubaer.islam.nahin.2024",
                  ),
                  _buildAppIcon(
                    icon: Icons.camera_alt_outlined,
                    label: "Instagram",
                    color: const Color(0xFFE4405F),
                    gradientColors: [
                      const Color(0xFF833AB4),
                      const Color(0xFFFD1D1D),
                      const Color(0xFFF56040),
                    ],
                    url:
                        "https://www.instagram.com/_nahin_17?igsh=cGE1OWVmNzc0Z2tv",
                  ),
                  // Swipe indicator App Hint icon
                  _buildSwipeHintAppIcon(accentColor),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSwipeHintAppIcon(Color accentColor) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          controller.phonePageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52.0,
              height: 52.0,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                    color: Colors.white.withValues(alpha: 0.15), width: 1.0),
              ),
              child: Icon(Icons.arrow_forward_ios_rounded,
                  color: accentColor, size: 20.0),
            ),
            const SizedBox(height: 6.0),
            Text(
              "Swipe Right",
              style: AppTextStyle.style(
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeViewerPage(
      BuildContext context, Color accentColor, Map<String, dynamic> theme) {
    final codeColor = theme["codeColor"] as Color;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Simulated IDE Header Tab (Tapping slides back to Home)
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                controller.phonePageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1), width: 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded,
                        size: 12.0, color: accentColor),
                    const SizedBox(width: 6.0),
                    Text(
                      "Back to Home",
                      style: AppTextStyle.style(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Code listing
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _codeLine(1, "class FlutterDeveloper {",
                    indent: 0, codeColor: codeColor),
                _codeLine(2, "final String name = 'Jubaer Islam Nahin';",
                    indent: 2, codeColor: codeColor),
                _codeLine(3, "final double experience = 2+; // years",
                    indent: 2, codeColor: codeColor),
                _codeLine(4, "final List<String> specialties = [",
                    indent: 2, codeColor: codeColor),
                _codeLine(5, "'State Management (GetX, Provider)',",
                    indent: 4, codeColor: codeColor),
                _codeLine(6, "'Clean Architecture / Feature-First',",
                    indent: 4, codeColor: codeColor),
                _codeLine(7, "'AI Integration (Gemini LLM)',",
                    indent: 4, codeColor: codeColor),
                _codeLine(8, "'Google Maps, Pusher(WebSockets)'",
                    indent: 4, codeColor: codeColor),
                _codeLine(9, "'Stripe, RevenueCat Payments'",
                    indent: 4, codeColor: codeColor),
                _codeLine(10, "];", indent: 2, codeColor: codeColor),
                _codeLine(11, "", indent: 0, codeColor: codeColor),
                _codeLine(12, "bool isCoding() => true;",
                    indent: 2, codeColor: codeColor),
                _codeLine(13, "}", indent: 0, codeColor: codeColor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (idx) {
        final isSelected = controller.phonePageIndex.value == idx;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: isSelected ? 12.0 : 6.0,
          height: 6.0,
          decoration: BoxDecoration(
            color:
                isSelected ? Colors.white : Colors.white.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(3.0),
          ),
        );
      }),
    );
  }

  Widget _buildDockBar(Color accentColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDockIcon(Icons.phone_rounded, const Color(0xFF34C759),
              "tel:+8801978581747"),
          _buildDockIcon(Icons.email_rounded, const Color(0xFF007AFF),
              "mailto:jubaernahin17@gmail.com"),
          _buildDockIcon(Icons.message_rounded, const Color(0xFF30D158),
              "https://wa.me/8801978581747"),
          // _buildDockIcon(Icons.language_rounded, const Color(0xFF00C7BE),
          //     "https://github.com/jubaernahin17"),
        ],
      ),
    );
  }

  Widget _buildAppIcon({
    required IconData icon,
    required String label,
    required Color color,
    required String url,
    List<Color>? gradientColors,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 52.0,
              height: 52.0,
              decoration: BoxDecoration(
                color: gradientColors == null ? color : null,
                gradient: gradientColors != null
                    ? LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 6.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 28.0),
            ),
            const SizedBox(height: 6.0),
            Text(
              label,
              style: AppTextStyle.style(
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDockIcon(IconData icon, Color color, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          width: 44.0,
          height: 44.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 4.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 22.0),
        ),
      ),
    );
  }

  Widget _codeLine(int num, String content,
      {int indent = 0, required Color codeColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20.0,
            child: Text(
              "$num",
              style: AppTextStyle.style(
                fontSize: 12.0,
                color: const Color(0xFF475569),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            " " * indent,
            style: const TextStyle(fontFamily: 'monospace'),
          ),
          RichText(
            text: TextSpan(
              style: AppTextStyle.style(
                fontSize: 13.0,
                color: const Color(0xFFE2E8F0),
              ),
              children: _parseCodeSyntax(content, codeColor),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _parseCodeSyntax(String text, Color keywordColor) {
    final List<TextSpan> spans = [];
    final words = text.split(" ");

    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final isKeyword =
          ["class", "final", "bool", "return", "true", "void"].contains(word);
      final isString =
          word.startsWith("'") || word.endsWith("'") || word.contains("'");
      final isComment =
          word.startsWith("//") || word.contains("//") || word.startsWith("/*");

      Color color = const Color(0xFFE2E8F0);
      if (isKeyword) {
        color = keywordColor;
      } else if (isString) {
        color = const Color(0xFF34D399); // Minty Green
      } else if (isComment) {
        color = const Color(0xFF64748B); // Slate
      } else if (word.contains("isCoding") || word.contains("=>")) {
        color = const Color(0xFF38BDF8); // Cyan
      }

      spans.add(TextSpan(
        text: word + (i == words.length - 1 ? "" : " "),
        style: TextStyle(color: color, fontFamily: 'monospace'),
      ));
    }
    return spans;
  }
}

// Typwriter text widget
class TypewriterText extends StatefulWidget {
  final List<String> texts;
  final TextStyle style;

  const TypewriterText({
    super.key,
    required this.texts,
    required this.style,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  int _textIndex = 0;
  int _charIndex = 0;
  bool _deleting = false;
  String _currentText = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!mounted) return;
      final fullText = widget.texts[_textIndex];
      if (!_deleting) {
        if (_charIndex < fullText.length) {
          _charIndex++;
          setState(() {
            _currentText = fullText.substring(0, _charIndex);
          });
        } else {
          _timer?.cancel();
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              _deleting = true;
              _startAnimation();
            }
          });
        }
      } else {
        if (_charIndex > 0) {
          _charIndex--;
          setState(() {
            _currentText = fullText.substring(0, _charIndex);
          });
        } else {
          _deleting = false;
          _textIndex = (_textIndex + 1) % widget.texts.length;
          _timer?.cancel();
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              _startAnimation();
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_currentText, style: widget.style),
        const SizedBox(width: 4.0),
        _Blinker(color: widget.style.color ?? const Color(0xFF2DD4BF)),
      ],
    );
  }
}

class _BlinkerState extends State<_Blinker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value > 0.5 ? 1.0 : 0.0,
          child: Container(
            width: 3.0,
            height: 24.0,
            color: widget.color,
          ),
        );
      },
    );
  }
}

class _Blinker extends StatefulWidget {
  final Color color;
  const _Blinker({required this.color});

  @override
  State<_Blinker> createState() => _BlinkerState();
}

// Dynamic clock class for simulated iPhone
class DynamicPhoneClock extends StatefulWidget {
  final bool isMini;
  final TextStyle? style;

  const DynamicPhoneClock({
    super.key,
    required this.isMini,
    this.style,
  });

  @override
  State<DynamicPhoneClock> createState() => _DynamicPhoneClockState();
}

class _DynamicPhoneClockState extends State<DynamicPhoneClock> {
  Timer? _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isMini) {
      // Mini clock format for status bar
      final String timeString = DateFormat('h:mm').format(_currentTime);
      return Text(
        timeString,
        style: widget.style ??
            AppTextStyle.style(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
      );
    } else {
      // Large clock formatting for lockscreen/homescreen page
      final String timeString = DateFormat('h:mm').format(_currentTime);
      final String dateString = DateFormat('EEEE, MMMM d').format(_currentTime);
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timeString,
            style: widget.style ??
                AppTextStyle.style(
                  fontSize: 48.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 2.0),
          Text(
            dateString,
            style: AppTextStyle.style(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      );
    }
  }
}

// Custom ScrollBehavior to support desktop mouse swipe/drag gestures
class MouseDragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
