import 'package:get/get.dart';

import '../../presentation/controllers/landing_page/landing_page_binding.dart';
import '../../presentation/pages/landing_page.dart';
import 'app_route.dart';


class Routes {
  static List<GetPage> getAllPages() {
    return [

      GetPage(
        name: AppRoutes.LANDING_PAGE,
        page: () => const LandingPage(),
        binding: LandingPageBinding(),
      ),

    ];
  }
}
