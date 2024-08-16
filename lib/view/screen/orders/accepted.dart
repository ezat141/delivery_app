import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/core/class/handlingdataview.dart';
import 'package:delivery_app/view/widget/orders/orderslistcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<OrdersAcceptedController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    // Print the data at the current index

                    return CardOrdersList(
                      listdata: controller.data[index],
                      controller: controller,
                    );
                  },
                ),
              )),
    );
  }
}
