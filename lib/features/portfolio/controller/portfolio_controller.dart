import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioController extends GetxController {
  // Navigation & Scrolling
  final ScrollController scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  var activeSection = 'Home'.obs;

  // Hover states for projects and social icons
  var hoveredProjectIndex = (-1).obs;
  var hoveredSkillIndex = (-1).obs;
  var hoveredNavIndex = (-1).obs;

  // Phone simulation states
  var phoneThemeIndex = 0.obs;
  var phonePageIndex = 0.obs;
  final phonePageController = PageController();

  // Contact Form
  final contactFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  var isSending = false.obs;
  var sendSuccess = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Add scroll listener to update active section based on scroll position
    scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();
    phonePageController.dispose();
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }

  void _onScroll() {
    // Determine which section is currently visible
    final scrollOffset = scrollController.offset;

    // We can check positions dynamically if keys are mounted
    try {
      final double aboutY = _getYPositionOfKey(aboutKey);
      final double skillsY = _getYPositionOfKey(skillsKey);
      final double projectsY = _getYPositionOfKey(projectsKey);
      final double contactY = _getYPositionOfKey(contactKey);

      // Simple threshold classification
      if (scrollOffset >= contactY - 200) {
        activeSection.value = 'Contact';
      } else if (scrollOffset >= projectsY - 200) {
        activeSection.value = 'Projects';
      } else if (scrollOffset >= skillsY - 200) {
        activeSection.value = 'Skills';
      } else if (scrollOffset >= aboutY - 200) {
        activeSection.value = 'About';
      } else {
        activeSection.value = 'Home';
      }
    } catch (_) {
      // Keys might not be rendered or context not available yet
    }
  }

  double _getYPositionOfKey(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      // We add scrollController.offset because localToGlobal returns viewport coordinate
      return position.dy + scrollController.offset;
    }
    return 0.0;
  }

  void scrollToSection(GlobalKey key, String sectionName) {
    activeSection.value = sectionName;
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  // Handle Contact Form Submission
  Future<void> submitContactForm() async {
    if (!contactFormKey.currentState!.validate()) {
      return;
    }

    isSending.value = true;
    sendSuccess.value = false;

    // Simulate sending message to backend
    await Future.delayed(const Duration(seconds: 2));

    isSending.value = false;
    sendSuccess.value = true;

    // Clear fields
    nameController.clear();
    emailController.clear();
    messageController.clear();

    // Show success alert
    Get.snackbar(
      'Message Sent!',
      'Thank you for reaching out. Nahin will get back to you soon!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF0F2B2B),
      colorText: const Color(0xFF2DD4BF),
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
      icon: const Icon(Icons.check_circle, color: Color(0xFF2DD4BF)),
    );

    // Reset success after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      sendSuccess.value = false;
    });
  }
}
