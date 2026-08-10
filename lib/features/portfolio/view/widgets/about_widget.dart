import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/helper/responsive_helper.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';

class AboutWidget extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final paddingX = ResponsiveHelper.responsiveSize(
      context,
      mobile: 20.0,
      tablet: 40.0,
      desktop: 80.0,
    );

    return Container(
      key: controller.aboutKey,
      color: const Color(0xFF0B0F19), // Alternate dark background
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Heading
          _buildHeading(),
          const SizedBox(height: 48.0),

          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _buildBioText(context)),
                    const SizedBox(width: 60.0),
                    Expanded(flex: 2, child: _buildStatsGrid(context)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBioText(context),
                    const SizedBox(height: 48.0),
                    _buildStatsGrid(context),
                  ],
                ),

          const SizedBox(height: 48.0),
          _buildEducationAndExperience(context),
        ],
      ),
    );
  }

  Widget _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ABOUT ME",
          style: AppTextStyle.style(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2DD4BF),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "My Journey",
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

  Widget _buildBioText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I am Jubaer Islam Nahin, a dedicated Flutter Developer with a passion for building production-ready, highly responsive applications for Android, iOS, and Web. With 2+ years of hands-on experience, I take pride in implementing clean architecture, scalable codebases, and rich animations that elevate the user experience.",
          style: AppTextStyle.style(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF94A3B8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          "I have a deep understanding of REST APIs, business logic implementation, Feature-First Architecture, and GetX state management. I love working with advanced integrations like JWT Auth, Pusher WebSockets, Stripe, RevenueCat, and Google Gemini AI API.",
          style: AppTextStyle.style(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF94A3B8),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final double spacing = ResponsiveHelper.isMobile(context) ? 16.0 : 20.0;

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildStatCard("2+ Years", "Flutter Experience")),
              SizedBox(width: spacing),
              Expanded(child: _buildStatCard("150+", "Problems Solved")),
            ],
          ),
        ),
        SizedBox(height: spacing),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildStatCard("3.56", "University CGPA")),
              SizedBox(width: spacing),
              Expanded(child: _buildStatCard("100%", "Clean Code / SOLID")),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String val, String desc) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            val,
            style: AppTextStyle.style(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF2DD4BF),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            desc,
            style: AppTextStyle.style(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationAndExperience(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(context);
    return isDesktop
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildExperienceTimeline(context)),
              const SizedBox(width: 48.0),
              Expanded(child: _buildEducationSection(context)),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExperienceTimeline(context),
              const SizedBox(height: 48.0),
              _buildEducationSection(context),
            ],
          );
  }

  Widget _buildExperienceTimeline(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.work_outline_rounded,
                color: Color(0xFF2DD4BF), size: 24.0),
            const SizedBox(width: 12.0),
            Text(
              "Professional Experience",
              style: AppTextStyle.style(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        _buildTimelineItem(
          role: "Executive Flutter Developer",
          company: "Softvence Alpha",
          period: "Nov 2025 - Present",
          description:
              "Developed and maintained production-ready Flutter applications using Feature-First Architecture and GetX. Integrated Pusher WebSockets, RevenueCat, Stripe payments, and Google Maps API.",
        ),
        _buildTimelineItem(
          role: "Flutter Developer Intern",
          company: "Marfah Technologies (Remote)",
          period: "June 2025 - July 2025",
          description:
              "Worked on Flutter web & mobile products in Agile sprints, managing Firebase databases, clean UI development, and version control (Git).",
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String role,
    required String company,
    required String period,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    role,
                    style: AppTextStyle.style(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  period,
                  style: AppTextStyle.style(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2DD4BF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              company,
              style: AppTextStyle.style(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              description,
              style: AppTextStyle.style(
                fontSize: 13.5,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF94A3B8),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.school_outlined,
                color: Color(0xFF2DD4BF), size: 24.0),
            const SizedBox(width: 12.0),
            Text(
              "Education",
              style: AppTextStyle.style(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "B.Sc. in Software Engineering",
                style: AppTextStyle.style(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                "Major in Data Science",
                style: AppTextStyle.style(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2DD4BF),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "Daffodil International University, Bangladesh",
                style: AppTextStyle.style(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                "Graduated: 2022 - 2025",
                style: AppTextStyle.style(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64748B),
                ),
              ),
              const Divider(color: Color(0xFF1E293B), height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cumulative CGPA",
                    style: AppTextStyle.style(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                  Text(
                    "3.56 / 4.00",
                    style: AppTextStyle.style(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF2DD4BF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32.0),
        Row(
          children: [
            const Icon(Icons.workspace_premium_outlined,
                color: Color(0xFF2DD4BF), size: 24.0),
            const SizedBox(width: 12.0),
            Text(
              "Key Achievements",
              style: AppTextStyle.style(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAchievementItem(
                title: "Finalist - Bizz Case Battle 2023",
                desc:
                    "Competed and emerged as a finalist in the prestigious business case study competition.",
              ),
              const Divider(color: Color(0xFF1E293B), height: 24.0),
              _buildAchievementItem(
                title: "Participant - DIU-SWE Programming Contest",
                desc:
                    "Participated in the software engineering department intra programming contest.",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementItem({required String title, required String desc}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.style(
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          desc,
          style: AppTextStyle.style(
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF94A3B8),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
