import 'package:clean_api_integration/src/core/services/network_service/api_client.dart';
import 'package:clean_api_integration/src/core/services/network_service/base_api_service.dart';
import 'package:clean_api_integration/src/core/services/network_service/entities/loader_entity.dart';
import 'package:clean_api_integration/src/core/services/network_service/routes/api_routes.dart';
import 'package:clean_api_integration/src/core/utils/logger.dart';
import 'package:clean_api_integration/src/modules/feature-mock/data/models/products_model.dart';

///
/// In Repository we configure API and returns the filtered result.
///
class MockRepository {
  final BaseApiService _apiService;

  MockRepository(this._apiService);

  Future<ProductModel> fetchProducts() async {
    try {
      var response = await _apiService.requestGET(
        apiRoute: ApiRouteEntity(endpoint: ApiRoutes.products),
      );
      return productModelFromJson(response);
    } catch (e) {
      appPrint('Error at repo: $e');
      rethrow;
    }
  }
}
