import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/bindings/application_bindings.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/product_routes.dart.dart';
import 'package:vakinha_burger_mobile/app/routes/splah_routers.dart';

Future <void> main()async {
  await GetStorage.init();
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Vakinha Burger",
      theme: VakinhaUI.theme,
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplahRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
      ],
    );
  }
}
