import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:nahin_portfolio/features/portfolio/view/screens/portfolio_home_screen.dart';

class SplashController extends GetxController {
  Timer? _timer;

  String? userLocation; // Store human-readable location

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  /// Start splash timer and navigate based on login status
  void startTimer() {
    log("Timer is calling ....................");
    _timer = Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(PortfolioHomeScreen.routeName);
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
