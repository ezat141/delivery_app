import 'dart:async';

import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/functions/handlingdatacontroller.dart';
import 'package:delivery_app/data/datasource/remote/orders/details_data.dart';
import 'package:delivery_app/data/model/cartmodel.dart';
import 'package:delivery_app/data/model/ordersmodel.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  late OrdersModel ordersModel;

  late Completer<GoogleMapController> completercontroller;
  List<Marker> markers = [];

  double? lat;
  double? long;
  Position? postion;
  CameraPosition? cameraPosition;

  initialData() {
    completercontroller = Completer<GoogleMapController>();
    if (ordersModel.ordersType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 12.4746,
      );
      markers.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      ));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    if (ordersModel == null) {
    print('Error: OrdersModel is null');
    statusRequest = StatusRequest.failure;
    update();
    return;
  }
    initialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    try {
      var response = await ordersDetailsData.getData(ordersModel.ordersId!);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          List listdata = response['cart']['items'];
          data.addAll(listdata.map((e) => CartModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
        // End
      }
    } catch (e) {
      print('Error occurred during HTTP request: $e');
    if (e is DioException) {
      // Handle DioException separately if needed
      print('DioException details: ${e.response?.data}');
      statusRequest = StatusRequest.failure;
    } else {
      // Handle other exceptions
      print('Unexpected error: $e');
      statusRequest = StatusRequest.failure;
    }
    }
    update();
  }
}
