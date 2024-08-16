



import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(int deliveryid) async {
    var response = await crud.postData(AppLink.viewArchivedOrders, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

}
