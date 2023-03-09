import 'package:product_list_with_get/domain/product/product.model.dart';
import 'package:product_list_with_get/infrastructure/data/services/product/product.service.dart';

class ProductRepository {
  final ProductService _productService;

  ProductRepository({required ProductService productService})
      : _productService = productService;

  Future<List<Product>> getProducts() async {
    try {
      final response = await _productService.getProduct();
      List<Product> products = response;
      return products;
    } catch (err) {
      rethrow;
    }
  }
}
