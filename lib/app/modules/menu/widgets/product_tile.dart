import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({ Key? key,required this.product }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return InkWell(
        onTap: (){
          Get.toNamed("/product_detail",arguments: product);
        },
        child: Container(margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkRbhG2zioy_iNNWjCII0XT9YIb1q58qedH8hAwtuGqtkkP_8id5wez83DdleIjq4dQB4&usqp=CAU") ,
                  fit: BoxFit.cover
                  )
              ),
            ),
            Expanded(child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                children:  [
              Text(
               product.name,
                style: VakinhaUI.textBold,
                ),
                Text(FormatterHelper.formatCurrency(product.price),)
              ]),
            ))
          ],
        ),
        ),
       );
  }
}