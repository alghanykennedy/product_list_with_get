import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list_with_get/domain/product/product.model.dart';
import 'package:product_list_with_get/infrastructure/navigation/routes.dart';

class ItemProductListWidget extends GetView {
  final List<Product> listData;

  ItemProductListWidget({required this.listData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 270,
      color: Colors.white,
      width: Get.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listData.isEmpty ? 0 : listData.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL,
                  arguments: listData[index]),
              child: Card(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 230,
                width: Get.width / 3,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: Get.width / 3,
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(listData[index].image),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: Text(
                        listData[index].title,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${listData[index].price}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
            );
          }),
    );
  }
}
