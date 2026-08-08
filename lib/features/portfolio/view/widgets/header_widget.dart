import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/helper/responsive_helper.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  HeaderWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A).withValues(alpha: 0.75),
            border: const Border(
              bottom: BorderSide(color: Color(0xFF1E293B), width: 1.0),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.responsiveSize(
              context,
              mobile: 16.0,
              tablet: 32.0,
              desktop: 80.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo/Brand Name
              GestureDetector(
                onTap: () =>
                    controller.scrollToSection(controller.homeKey, 'Home'),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2DD4BF), Color(0xFF6366F1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF2DD4BF)
                                  .withValues(alpha: 0.3),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Text(
                          "N",
                          style: AppTextStyle.style(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Text(
                        "Jubaer Islam Nahin",
                        style: AppTextStyle.style(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Navigation Links
              if (!isMobile && !isTablet)
                Row(
                  children: [
                    _buildNavLink('Home', controller.homeKey),
                    _buildNavLink('About', controller.aboutKey),
                    _buildNavLink('Skills', controller.skillsKey),
                    _buildNavLink('Projects', controller.projectsKey),
                    _buildNavLink('Contact', controller.contactKey),
                    const SizedBox(width: 24.0),
                    // Hire Me CTA Button
                    ElevatedButton(
                      onPressed: () => controller.scrollToSection(
                          controller.contactKey, 'Contact'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2DD4BF),
                        foregroundColor: const Color(0xFF0F172A),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0.0,
                      ).copyWith(
                        overlayColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.hovered)) {
                              return const Color(0xFF14B8A6);
                            }
                            return null;
                          },
                        ),
                      ),
                      child: Text(
                        "Hire Me",
                        style: AppTextStyle.style(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  ],
                )
              else
                // Menu trigger for Mobile/Tablet
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28.0),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavLink(String title, GlobalKey sectionKey) {
    return Obx(() {
      final isActive = controller.activeSection.value == title;
      return MouseRegion(
        onEnter: (_) =>
            controller.hoveredNavIndex.value = _getIndexForTitle(title),
        onExit: (_) => controller.hoveredNavIndex.value = -1,
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => controller.scrollToSection(sectionKey, title),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isActive
                        ? const Color(0xFF2DD4BF)
                        : (controller.hoveredNavIndex.value ==
                                _getIndexForTitle(title)
                            ? const Color(0xFF2DD4BF).withValues(alpha: 0.5)
                            : Colors.transparent),
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                title,
                style: AppTextStyle.style(
                  fontSize: 15.0,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive
                      ? const Color(0xFF2DD4BF)
                      : (controller.hoveredNavIndex.value ==
                              _getIndexForTitle(title)
                          ? const Color(0xFF2DD4BF).withValues(alpha: 0.8)
                          : const Color(0xFF94A3B8)),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  int _getIndexForTitle(String title) {
    switch (title) {
      case 'Home':
        return 0;
      case 'About':
        return 1;
      case 'Skills':
        return 2;
      case 'Projects':
        return 3;
      case 'Contact':
        return 4;
      default:
        return -1;
    }
  }
}
