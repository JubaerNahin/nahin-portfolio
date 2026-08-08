import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nahin_portfolio/features/portfolio/view/screens/portfolio_home_screen.dart';
import 'package:nahin_portfolio/util/app_routes/app_routes.dart';
import 'package:nahin_portfolio/util/helper/di.dart';
import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  diSetup();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jubaer Islam Nahin - Flutter Developer',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2DD4BF),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          initialRoute: PortfolioHomeScreen.routeName,
          getPages: AppRoutes.appRoutes,
        );
      },
    );
  }
}
