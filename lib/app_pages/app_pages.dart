import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:grit_map/app_routes/app_routes.dart';
import 'package:grit_map/dashboard/dashboard_controller.dart';
import 'package:grit_map/dashboard/dashboard_view.dart';
import '../dashboard/location_list_screen.dart';

class AppPages{
  static List<GetPage> appPages= <GetPage>[
    GetPage(
        name: AppRoutes.dashBoard,
        page: () => const DashBoardScreen(),
      binding: DashboardControllerBinding()
    ),
    GetPage(
        name: AppRoutes.locationMap,
        page: () =>const LocationListScreen(),
      binding: DashboardControllerBinding()
    ),
  ];
}