import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  // getData() async {
  //   var response = await crud.postData(AppLink.viewPendingOrders, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  Future<Map<String, dynamic>> getData() async {
    var response = await crud.getData(AppLink.viewPendingOrders);
    return response.fold((l) =>  throw l, (r) => r);
  }

  approveOrder(int orderid, int deliveryid) async {
    var response = await crud.postData(
        AppLink.approveOrders, {"orderid": orderid, "deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }
}
