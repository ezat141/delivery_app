import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/functions/getdecodepoyline.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
    Set<Polyline> polylineSet = {};

  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  List<Marker> markers = [];
  late StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  MyServices myServices = Get.find();
  Timer? timer;
  OrdersAcceptedController ordersAcceptedController = Get.find();

  double? currentlat;
  double? currentlong;
  double? destlat;
  double? destlong;

  CameraPosition? cameraPosition;

  donedelivery() async{
    statusRequest = StatusRequest.loading;
    update();
    await ordersAcceptedController.doneDelivery(ordersModel.ordersId!);
    Get.offAllNamed(AppRoute.homepage);

  }

  getCurrentLocation() {
    cameraPosition = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );

    markers.add(Marker(
      markerId: const MarkerId("dest"),
      position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
    ));
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print("================== Current Postion");
      currentlat = position!.latitude;
      currentlong = position.longitude;
      print(position.latitude);
      print(position.longitude);

      if (gmc != null) {
        gmc!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
      }
      markers.removeWhere((element) => element.markerId.value == "current");
      markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(position.latitude, position.longitude),
      ));
      update();
    });
  }
  refreshLocation() async{
    await Future.delayed(const Duration(seconds: 2));
    timer = Timer.periodic(Duration(seconds: 10), (timer){
      FirebaseFirestore.instance.collection("delivery").doc(ordersModel.ordersId.toString()).set({
        "lat": currentlat,
        "long" : currentlong,
        "deliveryid": myServices.sharedPreferences.getInt("id")
      });

    });

  }


  initPolyLine() async{
    destlat = ordersModel.addressLat;
    destlong = ordersModel.addressLong;
    await Future.delayed(const Duration(seconds: 1));
    polylineSet= await getPolyLine(currentlat!, currentlong, destlat, destlong);
    update();

  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    
    getCurrentLocation();
    refreshLocation();
    initPolyLine();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    gmc!.dispose();
    timer!.cancel();
    super.onClose();
  }
}
