import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../util/helper/responsive_helper.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';

class FooterWidget extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  FooterWidget({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch $urlString");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Container(
      color: const Color(0xFF020712), // Deep Slate background
      padding: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: ResponsiveHelper.responsiveSize(
          context,
          mobile: 16.0,
          tablet: 32.0,
          desktop: 80.0,
        ),
      ),
      child: Column(
        children: [
          isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left branding
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nahin.dev",
                          style: AppTextStyle.style(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          "Building premium, high-performance web & mobile experiences with Flutter.",
                          style: AppTextStyle.style(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),

                    // Back to top button
                    IconButton(
                      onPressed: () => controller.scrollToSection(
                          controller.homeKey, 'Home'),
                      icon: const Icon(Icons.arrow_upward,
                          color: Color(0xFF030712)),
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF2DD4BF),
                        padding: const EdgeInsets.all(12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Nahin.dev",
                      style: AppTextStyle.style(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Building premium, high-performance web & mobile experiences with Flutter.",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.style(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    IconButton(
                      onPressed: () => controller.scrollToSection(
                          controller.homeKey, 'Home'),
                      icon: const Icon(Icons.arrow_upward,
                          color: Color(0xFF030712)),
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF2DD4BF),
                        padding: const EdgeInsets.all(12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
          const Divider(color: Color(0xFF1E293B), height: 40.0),
          isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "© ${DateTime.now().year} Jubaer Islam Nahin. All rights reserved.",
                      style: AppTextStyle.style(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    Row(
                      children: [
                        _buildSocialIcon(Icons.code_rounded, "https://github.com/jubaernahin17", "GitHub"),
                        const SizedBox(width: 16.0),
                        _buildSocialIcon(Icons.business_rounded, "https://linkedin.com", "LinkedIn"),
                        const SizedBox(width: 16.0),
                        _buildSocialIcon(Icons.email_outlined, "mailto:jubaernahin17@gmail.com", "Email"),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      "© ${DateTime.now().year} Jubaer Islam Nahin. All rights reserved.",
                      style: AppTextStyle.style(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(Icons.code_rounded, "https://github.com/jubaernahin17", "GitHub"),
                        const SizedBox(width: 16.0),
                        _buildSocialIcon(Icons.business_rounded, "https://linkedin.com", "LinkedIn"),
                        const SizedBox(width: 16.0),
                        _buildSocialIcon(Icons.email_outlined, "mailto:jubaernahin17@gmail.com", "Email"),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url, String tooltip) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltip,
        child: GestureDetector(
          onTap: () => _launchUrl(url),
          child: Icon(
            icon,
            color: const Color(0xFF94A3B8),
            size: 22.0,
          ),
        ),
      ),
    );
  }
}
