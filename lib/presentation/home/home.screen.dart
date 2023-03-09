import 'package:product_list_with_get/presentation/home/widgets/item_product.widget.dart';
import 'package:product_list_with_get/presentation/home/widgets/item_product_grid.widget.dart';

import '/presentation/shared/loading/base.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('HomeScreen'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(child: Obx(() {
            return Column(
              children: [
                ItemProductListWidget(
                  listData: controller.products.value,
                ),
                ItemProductGridWidget(
                  listData: controller.products.value,
                )
              ],
            );
          }))),
    );
  }
}
