
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/functions/handlingdatacontroller.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  // late final AuthRepository authRepository; // Inject AuthRepository
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if (response['data']['delivery']['delivery_approve'] == true) {
            myServices.sharedPreferences
                .setInt("id", response['data']['delivery']['delivery_id']);
            int deliveryid = myServices.sharedPreferences.getInt("id")!;
            
            myServices.sharedPreferences
                .setString("username", response['data']['delivery']['delivery_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['delivery']['delivery_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['delivery']['delivery_phone']);
            myServices.sharedPreferences.setString("step", "2");

            // FirebaseMessaging.instance.subscribeToTopic("users");
            // FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            Get.offNamed(AppRoute.homepage);
          } else {
            Get.offNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  // @override
  // login() async {
  //   if (!formstate.currentState!.validate()) {
  //     // Handle form validation failure if needed
  //     return;
  //   }

  //   isLoading = true; // Set isLoading to true when logging in
  //   update();

  //   try {
  //     // Call AuthRepositoryImpl.login method
  //     final result = await authRepository.login(email: email.text, password: password.text);

  //     // Handle the result
  //     result.fold(
  //       (failure) {
  //         // Handle failure
  //         Get.defaultDialog(
  //           title: "Error",
  //           middleText: failure.errMessage,
  //         );
  //       },
  //       (success) {
  //         // Handle success (e.g., navigate to homepage)
  //         Get.offNamed(AppRoute.homepage);
  //       },
  //     );
  //   } catch (error) {
  //     // Handle unexpected errors
  //     print("Error occurred during login: $error");
  //     Get.defaultDialog(
  //       title: "Error",
  //       middleText: "An unexpected error occurred. Please try again later.",
  //     );
  //   } finally {
  //     isLoading = false; // Set isLoading to false when login process completes
  //     update();
  //   }
  // }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}

  // @override
  // login() async {
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     var response = await loginData.postdata(email.text, password.text);
  //     print("=============================== Controller $response ");
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         // data.addAll(response['data']);
  //         Get.offNamed(AppRoute.homepage);
  //       } else {
  //         Get.defaultDialog(
  //             title: "ُWarning", middleText: "Email Or Password Not Correct");
  //         statusRequest = StatusRequest.failure;
  //       }
  //     } else {

  //     }
  //   } else {

  //   }
  // }

//   @override
// login() async {
//   if (formstate.currentState!.validate()) {
//     statusRequest = StatusRequest.loading;
//     update();

//     try {
//       var response = await loginData.postdata(email.text, password.text);
//       print("=============================== Controller $response ");

//       if (response['status'] == "success") {
//         Get.offNamed(AppRoute.homepage);
//       } else {
//         Get.defaultDialog(
//           title: "Warning",
//           middleText: "Email Or Password Not Correct"
//         );
//         statusRequest = StatusRequest.failure;
//       }
//     } catch (error) {
//       print("Error occurred during login: $error");
//       Get.defaultDialog(
//         title: "Error",
//         middleText: "An error occurred during login. Please try again later."
//       );
//       statusRequest = StatusRequest.failure;
//     } finally {
//       update();
//     }
//   } else {
//     // Handle form validation failure if needed
//   }
// }

// @override
// login() async {
//   if (formstate.currentState!.validate()) {
//     statusRequest = StatusRequest.loading;
//     update();

//     try {
//       var response = await loginData.postdata(email.text, password.text);
//       print("=============================== Controller $response ");

//       if (StatusRequest.success == statusRequest)  {
//         if (response['status'] == "success") {
//           Get.offNamed(AppRoute.homepage);
//         } else {
//           Get.defaultDialog(
//             title: "Warning",
//             middleText: "Email Or Password Not Correct"
//           );
//           statusRequest = StatusRequest.failure;
//         }
//       } else {
//         // Handle invalid response format
//         print("Invalid server response format: $response");
//         Get.defaultDialog(
//           title: "Error",
//           middleText: "An error occurred during login. Please try again later."
//         );
//         statusRequest = StatusRequest.failure;
//       }
//     } catch (error) {
//       print("Error occurred during login: $error");
//       Get.defaultDialog(
//         title: "Error",
//         middleText: "An unexpected error occurred during login. Please try again later."
//       );
//       statusRequest = StatusRequest.failure;
//     } finally {
//       update();
//     }
//   } else {
//     // Handle form validation failure if needed
//   }
// }

// @override
// login() async {
//   if (formstate.currentState!.validate()) {
//     isLoading = true; // Set isLoading to true when logging in
//     update();

//     try {
//       var response = await loginData.postdata(email.text, password.text);

//       if (response is Map<String, dynamic>) {
//         if (response['status'] == "success") {
//           Get.offNamed(AppRoute.homepage);
//         } else {
//           // Handle failed login due to invalid credentials
//           Get.defaultDialog(
//             title: "Warning",
//             middleText: "Invalid email or password. Please try again.",
//           );
//         }
//       } else if (response is Failure) {
//         // Handle specific types of failures
//         if (response is ServerFailure) {
//           // Handle server failure
//           Get.defaultDialog(
//             title: "Error",
//             middleText: "Server error: ${response.errMessage}",
//           );
//         } else {
//           // Handle other types of failures
//           Get.defaultDialog(
//             title: "Error",
//             middleText: response.errMessage,
//           );
//         }
//       } else {
//         // Handle unexpected response format
//         Get.defaultDialog(
//           title: "Error",
//           middleText: "An unexpected error occurred. Please try again later.",
//         );
//       }
//     } catch (error) {
//       // Handle unexpected errors
//       print("Error occurred during login: $error");
//       Get.defaultDialog(
//         title: "Error",
//         middleText: "An unexpected error occurred. Please try again later.",
//       );
//     } finally {
//       isLoading = false; // Set isLoading to false when login process completes
//       update();
//     }
//   } else {
//     // Handle form validation failure if needed
//   }
// }

  // @override
  // Future <void> login() async {
  //   if (!formstate.currentState!.validate()) {
  //     // Handle form validation failure if needed
  //     return;
  //   }

  //   isLoading = true; // Set isLoading to true when logging in
  //   update();

  //   try {
  //     var response = await loginData.postdata(email.text, password.text);

  //     bool success = handleLoginResponse(response);
  //     if (success) {
  //       // Navigate to homepage if login is successful
  //       Get.offNamed(AppRoute.homepage);
  //     }
  //   } catch (error) {
  //     // Handle unexpected errors
  //     handleUnexpectedError();
  //   } finally {
  //     isLoading = false; // Set isLoading to false when login process completes
  //     update();
  //   }
  // }

  // bool handleLoginResponse(dynamic response) {
  //   if (response is Map<String, dynamic>) {
  //     if (response['status'] == "success") {
  //       return true; // Login successful
  //     } else {
  //       // Handle failed login due to invalid credentials
  //       Get.defaultDialog(
  //         title: "Warning",
  //         middleText: "Invalid email or password. Please try again.",
  //       );
  //     }
  //   } else if (response is Failure) {
  //     // Handle specific types of failures
  //     if (response is ServerFailure) {
  //       // Handle server failure
  //       Get.defaultDialog(
  //         title: "Error",
  //         middleText: "Server error: ${response.errMessage}",
  //       );
  //     } else {
  //       // Handle other types of failures
  //       Get.defaultDialog(
  //         title: "Error",
  //         middleText: response.errMessage,
  //       );
  //     }
  //   } else {
  //     // Handle unexpected response format
  //     Get.defaultDialog(
  //       title: "Error",
  //       middleText: "An unexpected error occurred. Please try again later.",
  //     );
  //   }

  //   return false; // Login failed
  // }

  // void handleUnexpectedError() {
  //   print("Error occurred during login: ");
  //   Get.defaultDialog(
  //     title: "Error",
  //     middleText: "An unexpected error occurred. Please try again later.",
  //   );
  // }


