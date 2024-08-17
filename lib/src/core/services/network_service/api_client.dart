import 'package:clean_api_integration/src/core/services/network_service/base_api_service.dart';
import 'package:clean_api_integration/src/core/services/network_service/entities/loader_entity.dart';
import 'package:clean_api_integration/src/core/services/network_service/response_handlers_mixin.dart';
import 'package:clean_api_integration/src/core/services/network_service/routes/api_routes.dart';
import 'package:clean_api_integration/src/core/utils/logger.dart';
import 'package:http/http.dart';

class ApiClient with ResponseHandlersMixin implements BaseApiService {
  final _http = Client();

  @override
  Future requestGET({
    required ApiRouteEntity apiRoute,
    Map<String, String>? headers,
  }) async {
    try {
      String route = "${apiRoute.base ?? ApiRoutes.baseUrl}${apiRoute.endpoint}";
      appLog(
        "\n***REQUESTING GET on route***: @$route "
        "\n***Headers: $headers",
      );

      Response response = await _http.get(
        Uri.parse(route),
        headers: headers,
      );

      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      if (result is Exception) {
        throw result;
      }
      return result;
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestPOST({
    required ApiRouteEntity loader,
    Object? data,
    Map<String, String>? headers,
  }) async {
    try {
      String route = "${loader.base ?? ApiRoutes.baseUrl}${loader.endpoint}";
      appLog(
        "\n***REQUESTING***: @$route "
        "\n***Payload:$data"
        "\n***Headers: $headers",
      );

      Response response = await _http.post(
        Uri.parse(route),
        headers: headers,
        body: data,
      );
      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      if (result is Exception) {
        throw result;
      }
      return result;
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestPUT({
    required ApiRouteEntity loader,
    Object? data,
    Map<String, String>? headers,
  }) async {
    try {
      String route = "${loader.base ?? ApiRoutes.baseUrl}${loader.endpoint}";
      appLog(
        "\n***REQUESTING [PUT]***: @$route "
        "\n***Payload:$data"
        "\n***Headers: $headers",
      );

      Response response = await _http.put(
        Uri.parse(route),
        headers: headers,
        body: data,
      );
      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      if (result is Exception) {
        throw result;
      }
      return result;
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestDELETE({
    required ApiRouteEntity loader,
    Object? data,
    Map<String, String>? headers,
  }) async {
    try {
      String route = "${loader.base ?? ApiRoutes.baseUrl}${loader.endpoint}";
      appLog(
        "\n***REQUESTING***: @$route "
        "\n***Payload:$data"
        "\n***Headers: $headers",
      );

      Response response = await _http.delete(
        Uri.parse(route),
        headers: headers,
        body: data,
      );
      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      if (result is Exception) {
        throw result;
      }
      return result;
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }
}
