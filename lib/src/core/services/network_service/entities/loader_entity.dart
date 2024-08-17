import 'package:clean_api_integration/src/core/services/network_service/routes/api_routes.dart';

class ApiRouteEntity {
  final String? base;
  final String endpoint;

  ApiRouteEntity({
    this.base = ApiRoutes.baseUrl,
    required this.endpoint,
  });
}
