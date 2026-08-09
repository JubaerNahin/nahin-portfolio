import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';
import '../widgets/header_widget.dart';
import '../widgets/hero_widget.dart';
import '../widgets/about_widget.dart';
import '../widgets/skills_widget.dart';
import '../widgets/projects_widget.dart';
import '../widgets/contact_widget.dart';
import '../widgets/footer_widget.dart';

class PortfolioHomeScreen extends GetView<PortfolioController> {
  static const String routeName = '/portfolio';

  const PortfolioHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Midnight Slate
      appBar: HeaderWidget(),
      endDrawer: _buildMobileDrawer(context),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          thumbVisibility: false,
          child: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                HeroWidget(),
                AboutWidget(),
                SkillsWidget(),
                ProjectsWidget(),
                ContactWidget(),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xFF0F172A),
        child: Container(
          decoration: const BoxDecoration(
            border:
                Border(left: BorderSide(color: Color(0xFF1E293B), width: 1.0)),
          ),
          child: Column(
            children: [
              // Drawer Header
              Container(
                height: 100.h,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jubaer Islam Nahin",
                      style: AppTextStyle.style(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close,
                          color: Colors.white, size: 24.0),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(color: Color(0xFF1E293B), height: 1.0),

              // Drawer Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    _buildDrawerItem(context, 'Home', controller.homeKey),
                    _buildDrawerItem(context, 'About', controller.aboutKey),
                    _buildDrawerItem(context, 'Skills', controller.skillsKey),
                    _buildDrawerItem(
                        context, 'Projects', controller.projectsKey),
                    _buildDrawerItem(context, 'Contact', controller.contactKey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, GlobalKey sectionKey) {
    return Obx(() {
      final isActive = controller.activeSection.value == title;
      return ListTile(
        title: Text(
          title,
          style: AppTextStyle.style(
            fontSize: 16.0,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? const Color(0xFF2DD4BF) : const Color(0xFF94A3B8),
          ),
        ),
        selected: isActive,
        selectedTileColor: const Color(0xFF1E293B).withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onTap: () {
          Navigator.pop(context); // Close drawer
          // Delay slightly to wait for drawer closing transition to complete smoothly
          Future.delayed(const Duration(milliseconds: 250), () {
            controller.scrollToSection(sectionKey, title);
          });
        },
      );
    });
  }
}
