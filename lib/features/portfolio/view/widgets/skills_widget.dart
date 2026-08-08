import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/helper/responsive_helper.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';

class SkillsWidget extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  SkillsWidget({super.key});

  final List<Map<String, dynamic>> coreFrameworks = [
    {"name": "Flutter", "level": 0.95},
    {"name": "Dart", "level": 0.95},
    {"name": "GetX", "level": 0.92},
    {"name": "BLoC / Provider", "level": 0.85},
    {"name": "Feature-First Architecture", "level": 0.90},
  ];

  final List<Map<String, dynamic>> apisDatabases = [
    {"name": "REST APIs", "level": 0.92},
    {"name": "Firebase / Firestore", "level": 0.88},
    {"name": "Node.js / Express", "level": 0.75},
    {"name": "MongoDB / PostgreSQL", "level": 0.78},
    {"name": "WebSockets (Pusher)", "level": 0.82},
  ];

  final List<Map<String, dynamic>> integrations = [
    {"name": "Gemini AI (LLM)", "level": 0.90},
    {"name": "Stripe Payments", "level": 0.85},
    {"name": "RevenueCat Subscriptions", "level": 0.82},
    {"name": "Google Maps API", "level": 0.88},
    {"name": "ZegoCloud (Audio/Video)", "level": 0.80},
  ];

  final List<Map<String, dynamic>> toolsDeployment = [
    {"name": "Git / GitHub", "level": 0.90},
    {"name": "Android Studio / VS Code", "level": 0.95},
    {"name": "Google Play Deployment", "level": 0.88},
    {"name": "Apple App Store Deployment", "level": 0.85},
    {"name": "Prompt Engineering", "level": 0.85},
  ];

  @override
  Widget build(BuildContext context) {
    final paddingX = ResponsiveHelper.responsiveSize(
      context,
      mobile: 20.0,
      tablet: 40.0,
      desktop: 80.0,
    );
    final isTablet = ResponsiveHelper.isTablet(context);

    int crossAxisCount = 4;
    if (ResponsiveHelper.isMobile(context)) {
      crossAxisCount = 1;
    } else if (isTablet) {
      crossAxisCount = 2;
    }

    return Container(
      key: controller.skillsKey,
      color: const Color(0xFF030712), // Deep Slate background
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(),
          const SizedBox(height: 48.0),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24.0,
            mainAxisSpacing: 24.0,
            childAspectRatio: ResponsiveHelper.responsiveSize(
              context,
              mobile: 0.95,
              tablet: 0.85,
              desktop: 0.72,
            ),
            children: [
              _buildSkillCategory("Core Frameworks", coreFrameworks, 0),
              _buildSkillCategory("APIs & Backend", apisDatabases, 1),
              _buildSkillCategory("Integrations", integrations, 2),
              _buildSkillCategory("Tools & Stores", toolsDeployment, 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MY TECH STACK",
          style: AppTextStyle.style(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2DD4BF),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Skills & Expertise",
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

  Widget _buildSkillCategory(String title, List<Map<String, dynamic>> skills, int groupIndex) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F19),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.5),
            blurRadius: 10.0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.style(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: skills.length,
              itemBuilder: (context, idx) {
                final skill = skills[idx];
                final skillId = groupIndex * 10 + idx;

                return Obx(() {
                  final isHovered = controller.hoveredSkillIndex.value == skillId;
                  return MouseRegion(
                    onEnter: (_) => controller.hoveredSkillIndex.value = skillId,
                    onExit: (_) => controller.hoveredSkillIndex.value = -1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  skill["name"],
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.style(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                    color: isHovered
                                        ? const Color(0xFF2DD4BF)
                                        : const Color(0xFFE2E8F0),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                "${(skill["level"] * 100).toInt()}%",
                                style: AppTextStyle.style(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: isHovered
                                      ? const Color(0xFF2DD4BF)
                                      : const Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6.0),
                          Stack(
                            children: [
                              Container(
                                height: 5.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(2.5),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: 5.0,
                                width: (skill["level"] as double) * (MediaQuery.of(context).size.width / (ResponsiveHelper.isMobile(context) ? 1.5 : 5.0) - 40.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: isHovered
                                        ? [const Color(0xFF2DD4BF), const Color(0xFF6366F1)]
                                        : [const Color(0xFF3B82F6), const Color(0xFF2DD4BF)],
                                  ),
                                  borderRadius: BorderRadius.circular(2.5),
                                  boxShadow: isHovered
                                      ? [
                                          BoxShadow(
                                            color: const Color(0xFF2DD4BF).withValues(alpha: 0.4),
                                            blurRadius: 4.0,
                                            spreadRadius: 0.5,
                                          )
                                        ]
                                      : [],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
