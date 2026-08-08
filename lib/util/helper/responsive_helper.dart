import 'package:flutter/material.dart';

class ResponsiveHelper {
  static const double mobileBreakPoint = 600.0;
  static const double tabletBreakPoint = 1024.0;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakPoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakPoint && width < tabletBreakPoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakPoint;
  }

  static double responsiveSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }

  // Returns standard size on desktop/tablet but scales with screen util on mobile
  static double getScale(BuildContext context, double baseMobileValue) {
    if (isDesktop(context) || isTablet(context)) {
      return baseMobileValue;
    }
    return baseMobileValue;
  }
}
