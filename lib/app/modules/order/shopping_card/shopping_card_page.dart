import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
    
    const ShoppingCardPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('ShoppingCardPage'),),
            body: Container(),
        );
    }
}