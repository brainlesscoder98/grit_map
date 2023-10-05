import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grit_map/dashboard/dashboard_controller.dart';
import 'package:grit_map/dashboard/dashboard_model.dart';
import '../common_widget/widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return GetBuilder<DashboardController>(
        builder: (controller) {
          // Use ListView.builder to display items with unique IDs
          return  Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

            floatingActionButton:GestureDetector(
                  onTap: () {
                    controller.gotoLocation();
                  },
                  child: GreenGradientNoWidth(
                    text: "Go to List",
                    fontSize: 22.sp,
                    radius: 60.sp,
                  )),
        appBar: AppBar(
          title: const Text('Grit Map',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: controller.shimmerLoading?const Center(child: CircularProgressIndicator()):CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: Get.height * 0.9,
                width: Get.width,
                // color: Colors.red,
                child: GoogleMap(
                  padding: EdgeInsets.symmetric(vertical: 90.sp),
                  indoorViewEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        controller.dashboardModels[0].latitude,
                        controller.dashboardModels[0].longitude
                    ),
                    zoom: 30, // Adjust the initial zoom level as needed
                  ),
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                    ),
                  },
                  markers: _buildMarkers(controller.dashboardModels),
                  // polygons: _buildPolygons(),
                ),
              ),
            ),

          ],
        ),
      );},
    );
  }
  Marker _buildCurrentLocationMarker(DashboardModel currentLocation) {
    final currentLocationIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
    return Marker(
      markerId: MarkerId("currentLocation"),
      position: LatLng(
        currentLocation.latitude,
        currentLocation.longitude,
      ),
      icon: currentLocationIcon,
      infoWindow: InfoWindow(
        title: 'Current Location',
        snippet: 'Time: ${currentLocation.serverTime}',
      ),
    );
  }

  Set<Marker> _buildMarkers(List<DashboardModel> dashboardDataList) {
    Set<Marker> markers = {};
    markers.add(_buildCurrentLocationMarker(dashboardDataList[0]));

    for (var data in dashboardDataList) {
      markers.add(
        Marker(
          markerId: MarkerId(data.uniqueId),
          position: LatLng(
            data.latitude,
            data.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Location',
            snippet: 'Time: ${data.serverTime}',
          ),
        ),
      );
    }

    return markers;
  }
}
