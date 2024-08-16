import 'package:delivery_app/view/screen/orders/accepted.dart';
import 'package:delivery_app/view/screen/orders/archive.dart';
import 'package:delivery_app/view/screen/orders/pending.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);  
}

class HomeScreenControllerImp extends HomeScreenController {

  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView(),
    
  ];

  List  bottomappbar = [
    {
      "title": "Pending",
      "icon": Icons.home,
    },
    {
      "title": "Accepted",
      "icon": Icons.add_shopping_cart_outlined,
    },
    {
      "title": "Delivered",
      "icon": Icons.delivery_dining,
    },
    
  ] ;  
  @override
  void changePage(int currentpage) {
    this.currentpage = currentpage;
    update();
  }
  
  
  
}