import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list_with_get/domain/product/product.model.dart';
import 'package:product_list_with_get/infrastructure/navigation/routes.dart';

class ItemProductGridWidget extends GetView {
  final List<Product> listData;

  ItemProductGridWidget({required this.listData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL,
                  arguments: listData[index]),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60)),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.network(listData[index].image),
                  )),
            );
          }),
    );
  }
}
