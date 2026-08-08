import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../util/helper/responsive_helper.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';

class ContactWidget extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  ContactWidget({super.key});

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

    return Container(
      key: controller.contactKey,
      color: const Color(0xFF030712), // Deep Slate background
      padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeading(),
          const SizedBox(height: 48.0),
          ResponsiveHelper.isDesktop(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildContactInfo(context)),
                    const SizedBox(width: 48.0),
                    Expanded(flex: 3, child: _buildContactForm(context)),
                  ],
                )
              : Column(
                  children: [
                    _buildContactInfo(context),
                    const SizedBox(height: 48.0),
                    _buildContactForm(context),
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
          "GET IN TOUCH",
          style: AppTextStyle.style(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2DD4BF),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Let's Discuss Your Project",
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

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Have an exciting project idea, or just want to chat? Drop me a message! I'm always open to discussing mobile development projects, API integrations, consulting, or full-time opportunities.",
          style: AppTextStyle.style(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF94A3B8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 40.0),
        _buildInfoItem(
          Icons.email_outlined,
          "Email Me",
          "jubaernahin17@gmail.com",
          onTap: () => _launchUrl("mailto:jubaernahin17@gmail.com"),
        ),
        const SizedBox(height: 24.0),
        _buildInfoItem(
          Icons.phone_iphone_outlined,
          "Call Me",
          "+8801978581747",
          onTap: () => _launchUrl("tel:+8801978581747"),
        ),
        const SizedBox(height: 24.0),
        _buildInfoItem(
          Icons.location_on_outlined,
          "Location",
          "Dhaka, Bangladesh",
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String subtitle, {required VoidCallback onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFF0B0F19),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: const Color(0xFF1E293B), width: 1.0),
              ),
              child: Icon(icon, color: const Color(0xFF2DD4BF), size: 24.0),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.style(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: AppTextStyle.style(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F19),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFF1E293B), width: 1.5),
      ),
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: controller.contactFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send Message",
              style: AppTextStyle.style(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24.0),

            // Name Field
            _buildLabel("Your Name"),
            TextFormField(
              controller: controller.nameController,
              style: const TextStyle(color: Colors.white),
              decoration: _buildInputDecoration("Enter your name"),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Name is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),

            // Email Field
            _buildLabel("Your Email"),
            TextFormField(
              controller: controller.emailController,
              style: const TextStyle(color: Colors.white),
              decoration: _buildInputDecoration("Enter your email"),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Email is required";
                }
                if (!GetUtils.isEmail(val.trim())) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),

            // Message Field
            _buildLabel("Your Message"),
            TextFormField(
              controller: controller.messageController,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration:
                  _buildInputDecoration("Describe your project details..."),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Message is required";
                }
                if (val.trim().length < 10) {
                  return "Message must be at least 10 characters";
                }
                return null;
              },
            ),
            const SizedBox(height: 32.0),

            // Submit button
            Obx(() {
              final loading = controller.isSending.value;
              return SizedBox(
                width: double.infinity,
                height: 52.0,
                child: ElevatedButton(
                  onPressed:
                      loading ? null : () => controller.submitContactForm(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2DD4BF),
                    foregroundColor: const Color(0xFF030712),
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
                  child: loading
                      ? const SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: CircularProgressIndicator(
                            color: Color(0xFF030712),
                            strokeWidth: 2.5,
                          ),
                        )
                      : Text(
                          "Send Message",
                          style: AppTextStyle.style(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF030712),
                          ),
                        ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: AppTextStyle.style(
          fontSize: 13.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF94A3B8),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF475569), fontSize: 14.0),
      filled: true,
      fillColor: const Color(0xFF030712),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFF1E293B), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFF2DD4BF), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }
}
