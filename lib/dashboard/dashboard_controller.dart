import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:grit_map/app_routes/app_routes.dart';
import 'package:grit_map/dashboard/dashboard_model.dart';
import 'package:http/http.dart' as http;

import '../app_urls/api_urls.dart';

class DashboardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();
  Future<List<dynamic>>? futureData;
  final RxBool _shimmerLoading = true.obs;
  bool get shimmerLoading => _shimmerLoading.value;
  List<DashboardModel> dashboardModels = [];
  String? locationName;
  @override
  void onInit() {
    getProductVariantList();
    super.onInit();
  }
  gotoLocation(){
    Get.toNamed(AppRoutes.locationMap);
  }
   Future<List<DashboardModel>> getProductVariantList() async {
     _shimmerLoading.value = true;
    http.Response response = await http.get(
      Uri.parse(ApiUrl.dashboardUrl,
      ),
    );

    log(response.statusCode.toString());
    log("${ApiUrl.dashboardUrl}===============>${response.body}");
    if (response.statusCode == 200) {
      update();
      _shimmerLoading.value = false;
      for (var data in dashboardModels) {
        locationName = await getLocationName(data.latitude, data.longitude);
        data.locationName = locationName ?? ''; // Handle null values
      }
      DashboardController.to.dashboardModels = dashboardModelFromJson(response.body);
      update();

      return DashboardController.to.dashboardModels;

    } else {
      throw Exception(response.body);
    }
  }
}
Future<String?> getLocationName(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      return place.name ?? '';
    } else {
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}




