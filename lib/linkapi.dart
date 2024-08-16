class AppLink {
  static const String server = "https://ecommerce-4hlw.onrender.com";
//
  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String login = "$server/deliveryAuth/login";

  // ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetPassword/checkEmail";
  static const String verifycodeforgetpassword =
      "$server/forgetPassword/verifyCode";
  static const String resetPassword = "$server/forgetPassword/resetPassword";

  // Home

  static const String homepage = "$server/home";

  static const String viewPendingOrders = "$server/delivery/deliveryPending";
  static const String viewAcceptedOrders = "$server/delivery/deliveryAccepted";
  static const String approveOrders = "$server/delivery/deliveryApprove";
  static const String viewArchivedOrders = "$server/delivery/deliveryArchive";
  static const String ordersdetails = "$server/orders/ordersDetailsView";
  static const String doneDelivery = "$server/delivery/deliveryDone";
}
