import 'package:get/route_manager.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_page.dart';

class SplahRouters {
  SplahRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: "/",
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
