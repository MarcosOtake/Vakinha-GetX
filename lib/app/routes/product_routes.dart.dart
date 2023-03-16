import 'package:get/get.dart';

import 'package:vakinha_burger_mobile/app/modules/product_dectail/product_dectail_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/product_dectail/product_dectail_page.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: "/product_detail",
      binding: ProductDectailBindings(),
      page: () => const ProductDectailPage(),
    )
  ];
}
