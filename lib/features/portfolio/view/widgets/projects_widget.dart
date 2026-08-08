import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../util/helper/responsive_helper.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';

class ProjectsWidget extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  ProjectsWidget({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      "title": "SmartShop - AI E-Commerce",
      "desc":
          "A cross-platform e-commerce application featuring a product catalog, shopping cart, checkout, Firebase Auth, and an AI chatbot powered by Google Gemini LLM API using Prompt Engineering.",
      "tags": ["Flutter", "Firebase", "Gemini AI", "REST APIs"],
      "github": "https://github.com/jubaernahin17",
      "live": "https://github.com/jubaernahin17"
    },
    {
      "title": "Real-time Messaging & Payments",
      "desc":
          "Production modules developed at Softvence Alpha. Implemented Pusher WebSockets for real-time bid systems, Stripe Payment gateways, and RevenueCat subscription models.",
      "tags": ["Flutter", "Pusher WebSockets", "Stripe API", "RevenueCat"],
      "github": "https://github.com/jubaernahin17",
      "live": "https://github.com/jubaernahin17"
    },
    {
      "title": "Location-Based Tracking System",
      "desc":
          "An advanced geocoding and live tracking system built using Google Maps API. Supports real-time routing, coordinates tracking, geofencing, and background services.",
      "tags": ["Flutter", "Google Maps API", "Geocoding", "Bg Location"],
      "github": "https://github.com/jubaernahin17",
      "live": "https://github.com/jubaernahin17"
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
    final paddingX = ResponsiveHelper.responsiveSize(
      context,
      mobile: 20.0,
      tablet: 40.0,
      desktop: 80.0,
    );
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    Widget content;
    if (isMobile) {
      content = Column(
        children: [
          _buildProjectCard(projects[0], 0, context),
          const SizedBox(height: 24.0),
          _buildProjectCard(projects[1], 1, context),
          const SizedBox(height: 24.0),
          _buildProjectCard(projects[2], 2, context),
        ],
      );
    } else if (isTablet) {
      content = Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _buildProjectCard(projects[0], 0, context)),
                const SizedBox(width: 24.0),
                Expanded(child: _buildProjectCard(projects[1], 1, context)),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _buildProjectCard(projects[2], 2, context)),
                const SizedBox(width: 24.0),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ],
      );
    } else {
      content = IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _buildProjectCard(projects[0], 0, context)),
            const SizedBox(width: 24.0),
            Expanded(child: _buildProjectCard(projects[1], 1, context)),
            const SizedBox(width: 24.0),
            Expanded(child: _buildProjectCard(projects[2], 2, context)),
          ],
        ),
      );
    }

    return Container(
      key: controller.projectsKey,
      color: const Color(0xFF0B0F19), // Alternate dark background
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(),
          const SizedBox(height: 48.0),
          content,
        ],
      ),
    );
  }

  Widget _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MY PORTFOLIO",
          style: AppTextStyle.style(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2DD4BF),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Recent Projects",
          style: AppTextStyle.style(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          width: 60.0,
          height: 3.0,
          color: const Color(0xFF2DD4BF),
        ),
      ],
    );
  }

  Widget _buildProjectCard(
      Map<String, dynamic> proj, int index, BuildContext context) {
    return Obx(() {
      final isHovered = controller.hoveredProjectIndex.value == index;

      return MouseRegion(
        onEnter: (_) => controller.hoveredProjectIndex.value = index,
        onExit: (_) => controller.hoveredProjectIndex.value = -1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: isHovered
              ? Matrix4.translationValues(0.0, -8.0, 0.0)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color:
                  isHovered ? const Color(0xFF2DD4BF) : const Color(0xFF1E293B),
              width: 1.5,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF2DD4BF).withValues(alpha: 0.12),
                      blurRadius: 20.0,
                      spreadRadius: 2.0,
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Folder icon & Action links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.folder_open_rounded,
                        color: Color(0xFF2DD4BF),
                        size: 32.0,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.code_rounded, size: 20.0),
                            onPressed: () => _launchUrl(proj["github"]),
                            color: const Color(0xFF94A3B8),
                            hoverColor:
                                const Color(0xFF2DD4BF).withValues(alpha: 0.1),
                          ),
                          IconButton(
                            icon: const Icon(Icons.open_in_new_rounded,
                                size: 20.0),
                            onPressed: () => _launchUrl(proj["live"]),
                            color: const Color(0xFF94A3B8),
                            hoverColor:
                                const Color(0xFF2DD4BF).withValues(alpha: 0.1),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),

                  // Project Title
                  Text(
                    proj["title"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.style(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  // Project Description
                  Text(
                    proj["desc"],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.style(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF94A3B8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),

              // Tags row
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: (proj["tags"] as List<String>).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0B0F19),
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: const Color(0xFF1E293B),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          tag,
                          style: AppTextStyle.style(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2DD4BF),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
