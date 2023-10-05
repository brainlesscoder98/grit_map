import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Location List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: GetBuilder<DashboardController>(
          builder: (controller) {
        // Use ListView.builder to display items with unique IDs
        return controller.shimmerLoading?const Center(child: CircularProgressIndicator()): ListView.builder(
              shrinkWrap: true,

              itemCount: 3, // The total number of items in the list
              itemBuilder: (BuildContext context, int index) {
                // The itemBuilder callback is called for each item in the list.
                // It should return a widget that represents the item at the given index.

                return  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.sp,vertical: 10.sp),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding:  EdgeInsets.symmetric(horizontal: 15.sp,vertical: 15.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width*0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: Get.width*0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("From Location",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 5,),
                                        Text(controller.dashboardModels[index].latitude.toString()),
                                      ],
                                    )),
                                SizedBox(
                                    width: Get.width*0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("To Location",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        Text(controller.dashboardModels[index].longitude.toString()),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.sp,),
                          SizedBox(
                            width: Get.width*0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: Get.width*0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("From Time",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 5,),
                                        Text(controller.dashboardModels[index].latitude.toString()),
                                      ],
                                    )),
                                SizedBox(
                                    width: Get.width*0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("To Time",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                        Text(controller.dashboardModels[index].longitude.toString()),
                                      ],
                                    )),    ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );// Replace YourListItemWidget with your custom list item widget.
              },
            );}),
    );
  }
}
