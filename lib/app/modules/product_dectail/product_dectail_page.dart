import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import '../menu/widgets/plus_minus_box.dart';
import './product_dectail_controller.dart';

class ProductDectailPage extends GetView<ProductDectailController> {
  const ProductDectailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: LayoutBuilder(builder: (_, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(controller.product.image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(controller.product.description,
                        style: context.textTheme.bodyText2!),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return PlusMinusBox(
                      minusCallback: controller.removeProduct,
                      plusCallback: controller.addProduct,
                      price: controller.product.price,
                      quantity: controller.quantity,
                    );
                  }),
                  const Divider(),
                  ListTile(
                      title: const Text(
                        "Total",
                        style: VakinhaUI.textBold,
                      ),
                      trailing: Obx(() {
                        return Text(
                          FormatterHelper.formatCurrency(controller.totalPrice),
                          style: VakinhaUI.textBold,
                        );
                      })),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child: VakinhaButton(
                        label:
                            controller.alreadyAdded ? "ATUALIZAR" : "ADICIONAR",
                        onPressed: controller.addProductInShoppingCard,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              )),
        );
      }),
    );
  }
}
