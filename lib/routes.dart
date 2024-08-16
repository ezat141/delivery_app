
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/middleware/mymiddleware.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:delivery_app/view/screen/auth/login.dart';
import 'package:delivery_app/view/screen/homescreen.dart';
import 'package:delivery_app/view/screen/language.dart';
import 'package:delivery_app/view/screen/onboarding.dart';
import 'package:delivery_app/view/screen/orders/accepted.dart';
import 'package:delivery_app/view/screen/orders/archive.dart';
import 'package:delivery_app/view/screen/orders/details.dart';
import 'package:delivery_app/view/screen/orders/pending.dart';
import 'package:delivery_app/view/screen/orders/tracking.dart';
import 'package:get/get.dart';

// Map<String, Widget Function(BuildContext)> routes = {
//   // Auth
//   AppRoute.login: (context) => const Login(),
//   AppRoute.signUp: (context) => const SignUp(),
//   AppRoute.forgetPassword: (context) => const ForgetPassword(),
//   AppRoute.verfiyCode: (context) => const VerfiyCode(),
//   AppRoute.resetPassword: (context) => const ResetPassword(),
//   AppRoute.successResetpassword: (context) => const SuccessResetPassword(),
//   AppRoute.successSignUp: (context) => const SuccessSignUp(),
//   // OnBoarding
//   AppRoute.onBoarding: (context) => const OnBoarding(),
//   AppRoute.verfiyCodeSignUp: (context) => const VerfiyCodeSignUp(),
// };
List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  // GetPage(name: AppRoute.cart, page: () => const Cart()),

  GetPage(
    name: AppRoute.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoute.verfiyCode,
    page: () => const VerfiyCode(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoute.successResetpassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoute.onBoarding,
    page: () => const OnBoarding(),
  ),
  
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  //
  // GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersaccepted, page: () => const OrdersAccepted()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
    GetPage(name: AppRoute.tracking, page: () => const OrdersTracking()),

  // GetPage(name: AppRoute.offers, page: () => const OffersView()),
];
