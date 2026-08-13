import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../util/helper/responsive_helper.dart';
import '../../../../util/text_style/app_text_style.dart';
import '../../controller/portfolio_controller.dart';

const String _appleSvg = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
  <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M15.97 6.32c.63-.78 1.06-1.85.94-2.92-.91.04-2.03.61-2.68 1.37-.58.67-1.09 1.76-.95 2.81 1.03.08 2.06-.48 2.69-1.26z"/>
</svg>
''';

const String _playStoreSvg = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
  <path d="M3.609 1.814L13.792 12 3.61 22.186a1.53 1.53 0 0 1-.61-.318A1.488 1.488 0 0 1 2.55 20.73V3.27c0-.422.158-.806.45-1.138.18-.204.38-.337.609-.318zm11.603 11.603l2.25 2.25-10.74 6.223 8.49-8.473zm0-2.834L6.722 2.11 17.462 8.33l-2.25 2.25zm2.348 2.348l3.197-1.85c.677-.392 1.093-1.093 1.093-1.87 0-.777-.416-1.478-1.093-1.87l-3.197-1.85-2.5 2.5 2.5 2.5z"/>
</svg>
''';

const String _githubSvg = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
  <path d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.53 1.032 1.53 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/>
</svg>
''';

class ProjectsWidget extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  ProjectsWidget({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      "title": "Lori Movers",
      "badge": "Available in App Store & Play Store",
      "desc":
          "Developed and maintained Flutter-based User and Rider applications for Android and iOS. Implemented truck booking, real-time trip tracking, Google Maps, payments, authentication, and push notifications. Integrated Laravel REST APIs and Firebase while optimizing performance and maintaining clean, scalable code.",
      "tags": [
        "Flutter",
        "Android",
        "iOS",
        "Google Maps",
        "Firebase",
        "Laravel REST API"
      ],
      "isMultiApp": true,
      "subApps": [
        {
          "name": "User",
          "links": [
            {
              "type": "app_store",
              "label": "App Store",
              "url": "https://apps.apple.com/in/app/lori-movers/id6752539221"
            },
            {
              "type": "play_store",
              "label": "Play Store",
              "url":
                  "https://play.google.com/store/apps/details?id=com.andrewngugi.lori.lori"
            }
          ]
        },
        {
          "name": "Rider",
          "links": [
            {
              "type": "app_store",
              "label": "App Store",
              "url":
                  "https://play.google.com/store/apps/details?id=com.lorimovers.driversapp"
            },
            {
              "type": "play_store",
              "label": "Play Store",
              "url":
                  "https://play.google.com/store/apps/details?id=com.lorimovers.driversapp"
            }
          ]
        }
      ]
    },
    {
      "title": "Lifresh - Ecommerce",
      "badge": "Available in App Store & Play Store",
      "desc":
          "Designed and implemented a Flutter-based grocery shopping application for Android and iOS. Built features including product browsing, search, cart management, secure authentication, checkout, payments, and REST API integration.",
      "tags": [
        "Flutter",
        "Android",
        "iOS",
        "E-Commerce",
        "REST API",
        "Payments"
      ],
      "isMultiApp": false,
      "links": [
        {
          "type": "app_store",
          "label": "App Store",
          "url": "https://apps.apple.com/us/app/lifresh-app"
        },
        {
          "type": "play_store",
          "label": "Play Store",
          "url": "https://play.google.com/store/apps/details?id=com.lifresh.app"
        }
      ]
    },
    {
      "title": "Willow Wellness - Meditation",
      "badge": "Available in App Store",
      "desc":
          "Built and enhanced a Flutter-based meditation and wellness application for Android and iOS. Implemented guided meditation, sleep programs, subscription management, authentication, push notifications, and REST API integration.",
      "tags": [
        "Flutter",
        "Android",
        "iOS",
        "Meditation",
        "Subscriptions",
        "REST API"
      ],
      "isMultiApp": false,
      "links": [
        {
          "type": "app_store",
          "label": "App Store",
          "url": "https://apps.apple.com/us/app/willow-wellness/id6749893032"
        }
      ]
    },
    {
      "title": "Personal Library App",
      "badge": "University Course Project",
      "desc":
          "This was a university project I developed using Java. It is a web-based library management application primarily focused on implementing CRUD operations for managing library resources. I also implemented the MVC (Model-View-Controller) architecture to ensure a structured and maintainable codebase.",
      "tags": ["Java", "SpringBoot", "Html", "Css", "Thymeleaf", "REST API"],
      "isMultiApp": false,
      "links": [
        {
          "type": "github",
          "label": "GitHub",
          "url": "https://github.com/JubaerNahin/PersonalLibraryApp"
        }
      ]
    },
    {
      "title": "SmartShop - AI-Powered E-Commerce App",
      "badge": "Final Year Project",
      "desc":
          "Developed a cross-platform e-commerce application featuring product catalog, shopping cart, checkout, Firebase Authentication, and an AI chatbot powered by Google Gemini. Implemented Prompt Engineering and integrated the Gemini AI API to generate intelligent conversational responses. Built using Flutter, Firebase, and REST APIs following clean and scalable development practices.",
      "tags": [
        "Flutter",
        "Google Gemini AI",
        "Firebase Auth",
        "Prompt Engineering",
        "REST API"
      ],
      "isMultiApp": false,
      "links": [
        {
          "type": "github",
          "label": "GitHub",
          "url": "https://github.com/JubaerNahin/smartshop"
        }
      ]
    }
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

    Widget content;
    if (isMobile) {
      content = Column(
        children: projects
            .asMap()
            .entries
            .map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: _buildProjectCard(entry.value, entry.key, context),
              ),
            )
            .toList(),
      );
    } else {
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
                Expanded(child: _buildProjectCard(projects[3], 3, context)),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _buildProjectCard(projects[4], 4, context)),
              ],
            ),
          ),
        ],
      );
    }

    return Container(
      key: controller.projectsKey,
      color: const Color(0xFF0B0F19),
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
              ? Matrix4.translationValues(0.0, -6.0, 0.0)
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.folder_open_rounded,
                        color: Color(0xFF2DD4BF),
                        size: 32.0,
                      ),
                      if (proj["badge"] != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color:
                                const Color(0xFF2DD4BF).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: const Color(0xFF2DD4BF)
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            proj["badge"],
                            style: AppTextStyle.style(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2DD4BF),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Text(
                    proj["title"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.style(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    proj["desc"],
                    style: AppTextStyle.style(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF94A3B8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  _buildLinksSection(proj),
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

  Widget _buildLinksSection(Map<String, dynamic> proj) {
    final bool isMultiApp = proj["isMultiApp"] ?? false;

    if (isMultiApp) {
      final List subApps = proj["subApps"] as List;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: subApps.map((subApp) {
          final String appName = subApp["name"];
          final List links = subApp["links"] as List;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$appName : ",
                  style: AppTextStyle.style(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 6.0,
                    children: links.map((link) {
                      return _buildStoreButton(
                        label: link["label"],
                        type: link["type"],
                        url: link["url"],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    } else {
      final List links = proj["links"] as List;
      return Wrap(
        spacing: 10.0,
        runSpacing: 8.0,
        children: links.map((link) {
          return _buildStoreButton(
            label: link["label"],
            type: link["type"],
            url: link["url"],
          );
        }).toList(),
      );
    }
  }

  Widget _buildStoreButton({
    required String label,
    required String type,
    required String url,
  }) {
    String svgIcon;
    Color accentColor;

    if (type == "app_store") {
      svgIcon = _appleSvg;
      accentColor = const Color(0xFF38BDF8);
    } else if (type == "play_store") {
      svgIcon = _playStoreSvg;
      accentColor = const Color(0xFF34D399);
    } else {
      svgIcon = _githubSvg;
      accentColor = const Color(0xFFA78BFA);
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _launchUrl(url),
          borderRadius: BorderRadius.circular(8.0),
          hoverColor: accentColor.withValues(alpha: 0.15),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: const Color(0xFF0B0F19),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: accentColor.withValues(alpha: 0.35),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.string(
                  svgIcon,
                  width: 14.0,
                  height: 14.0,
                  colorFilter: ColorFilter.mode(accentColor, BlendMode.srcIn),
                ),
                const SizedBox(width: 6.0),
                Text(
                  label,
                  style: AppTextStyle.style(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4.0),
                Icon(
                  Icons.arrow_outward_rounded,
                  size: 12.0,
                  color: accentColor.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
