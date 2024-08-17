import 'package:clean_api_integration/src/core/services/network_service/api_client.dart';
import 'package:clean_api_integration/src/core/services/network_service/routes/api_routes.dart';
import 'package:clean_api_integration/src/core/utils/logger.dart';
import 'package:clean_api_integration/src/modules/feature-mock/data/models/products_model.dart';
import 'package:clean_api_integration/src/modules/feature-mock/domain/repositories/mock_repo.dart';
import 'package:get/get.dart';

///
/// This class is used for UI logic.
/// Here we can show snackBars handle any UI logic to display on screen/UI.
///

class MockController extends GetxController {
  final MockRepository _mockRepository = MockRepository(ApiClient());

  List<String> buffers = [];

  addLoader(String id) {
    buffers.add(id);
    refresh();
  }

  removeLoader(String id) {
    buffers.remove(id);
    refresh();
  }

  bool hasLoader(String id) {
    return buffers.contains(id);
  }

  ProductModel? productModel;

  fetchProducts() async {
    try {
      if (hasLoader(ApiRoutes.products)) {
        print('contains');
        return;
      } else {
        print('empty');
        addLoader(ApiRoutes.products);
        productModel = await _mockRepository.fetchProducts();
        refresh();
      }
    } catch (e) {
      appPrint(e);
    } finally {
      removeLoader(ApiRoutes.products);
    }
  }
}
