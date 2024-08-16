import 'dart:io';
import 'package:delivery_app/controller/homescreen_controller.dart';
import 'package:delivery_app/core/constant/color.dart';
import 'package:delivery_app/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Orders", style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
                centerTitle: true,
                
              ),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: PopScope(
                  child: controller.listPage.elementAt(controller.currentpage),
                  onPopInvoked: (shouldPop) async {
                    await Get.defaultDialog(
                      title: "warning",
                      titleStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                      middleText: "Are you sure you want to exit?",
                      onCancel: () {},
                      cancelTextColor: AppColor.secondColor,
                      confirmTextColor: AppColor.secondColor,
                      buttonColor: AppColor.thirdColor,
                      onConfirm: () {
                        exit(0);
                      },
                    );
                    shouldPop = false;
                  }),
            ));
  }
}
