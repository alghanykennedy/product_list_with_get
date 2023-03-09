import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list_with_get/domain/product/product.model.dart';
import 'package:product_list_with_get/presentation/shared/loading/base.widget.dart';

class ProductDetailScreen extends GetView {
  final Product data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(data.title),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: Get.width,
                    height: Get.height / 2.3,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Image.network(
                      data.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${data.price}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.title,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Divider(thickness: 1),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Detail Product',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Etalase'),
                                    SizedBox(width: 50),
                                    Text(data.category,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Divider(thickness: 1),
                                ),
                                Text(
                                  data.description,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
