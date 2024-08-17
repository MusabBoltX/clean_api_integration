import 'package:clean_api_integration/src/core/services/network_service/entities/loader_entity.dart';

abstract class BaseApiService {
  Future requestGET({required ApiRouteEntity apiRoute});

  Future requestPOST({required ApiRouteEntity loader, Object? data});

  Future requestPUT({required ApiRouteEntity loader, Object? data});

  Future requestDELETE({required ApiRouteEntity loader, Object? data});
}
