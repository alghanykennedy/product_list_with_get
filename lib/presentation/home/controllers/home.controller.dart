import 'package:product_list_with_get/domain/product/product.model.dart';
import 'package:product_list_with_get/domain/product/product.repository.dart';

import '/domain/core/utils/snackbar.util.dart';
import '/presentation/shared/loading/loading.controller.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository _productRepository;
  final _loadingController = Get.find<LoadingController>();

  HomeController({required ProductRepository productRepository})
      : _productRepository = productRepository;

  final products = RxList<Product>();

  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      _loadingController.isLoading = true;
      products.value = await _productRepository.getProducts();
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }
}
