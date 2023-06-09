import 'package:get/route_manager.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_page.dart';
import 'package:vakinha_burger_mobile/app/modules/login/login_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/login/login_page.dart';

class AuthRouters {
  AuthRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: "/auth/login",
      binding:LoginBindings(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: "/auth/register",
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    ),
  ];
}
