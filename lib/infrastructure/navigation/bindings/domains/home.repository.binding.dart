import 'package:product_list_with_get/domain/product/product.repository.dart';
import 'package:product_list_with_get/infrastructure/data/services/product/product.service.dart';

class HomeRepositoryBinding {
  late ProductRepository _productRepository;

  ProductRepository get repository => _productRepository;

  HomeRepositoryBinding() {
    final productService = ProductService();
    _productRepository = ProductRepository(productService: productService);
  }
}
