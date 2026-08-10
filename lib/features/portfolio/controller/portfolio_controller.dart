import 'package:dio/dio.dart' as dio_pkg;
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
  Future<void> submitContactForm(BuildContext context) async {
    if (!contactFormKey.currentState!.validate()) {
      return;
    }

    isSending.value = true;
    sendSuccess.value = false;

    try {
      final dio = dio_pkg.Dio();
      final response = await dio.post(
        'https://api.emailjs.com/api/v1.0/email/send',
        options: dio_pkg.Options(
          headers: {
            'Content-Type': 'application/json',
            'origin': 'http://localhost',
          },
        ),
        data: {
          'service_id': 'service_mie09bo',
          'template_id': 'template_e9av3rm',
          'user_id': 'K1xz65k3pST86uzYY',
          'template_params': {
            'from_name': nameController.text.trim(),
            'from_email': emailController.text.trim(),
            'name': nameController.text.trim(),
            'email': emailController.text.trim(),
            'reply_to': emailController.text.trim(),
            'message': messageController.text.trim(),
          },
        },
      );

      debugPrint('EmailJS response: ${response.statusCode} - ${response.data}');

      if (response.statusCode == 200) {
        sendSuccess.value = true;

        nameController.clear();
        emailController.clear();
        messageController.clear();

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
      } else {
        throw Exception('Server returned ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('ERROR sending email: $e');

      Get.snackbar(
        'Failed',
        'Could not send message. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF2B0F0F),
        colorText: const Color(0xFFF87171),
        borderRadius: 8,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
        icon: const Icon(Icons.error_outline, color: Color(0xFFF87171)),
      );
    } finally {
      isSending.value = false;
    }
  }
}
