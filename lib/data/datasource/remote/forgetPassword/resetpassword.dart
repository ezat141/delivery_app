import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';


class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String email, String newPassword) async {
    var response = await crud.postData(
        AppLink.resetPassword, {"email": email, "newPassword": newPassword});
    return response.fold((l) => l, (r) => r);
  }
}
