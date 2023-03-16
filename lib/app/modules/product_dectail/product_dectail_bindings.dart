import 'package:get/get.dart';
import './product_dectail_controller.dart';

class ProductDectailBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ProductDectailController(shoppingCardService: Get.find()));
    }
}