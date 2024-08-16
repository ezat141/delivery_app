
import 'package:delivery_app/bindings/intialbindings.dart';
import 'package:delivery_app/core/localization/changelocal.dart';
import 'package:delivery_app/core/localization/translation.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding:InitialBindings() ,
      // home: const Language(),
      // routes: routes,
      getPages: routes,
    );
  }
}
