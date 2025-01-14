import 'package:clean_api_integration/src/core/exceptions/exceptions.dart';
import 'package:clean_api_integration/src/core/services/network_service/entities/error_entity.dart';
import 'package:clean_api_integration/src/core/utils/logger.dart';
import 'package:http/http.dart';

mixin ResponseHandlersMixin {
  ///
  /// This is a generic function for handling the API call responses based on status code
  ///
  filterResponse(Response response) {
    appPrint("\n");
    appPrint("Response: ${response.body}\n");
    appPrint("Status Code: ${response.statusCode}");
    appPrint("\n");
    if (response.statusCode == 200 || response.statusCode < 300) return _onSuccess(response);
    if (response.statusCode == 400) return _onBadRequest(response);
    if (response.statusCode == 401) return _onUnAuthorized(response);
    if (response.statusCode == 403) return _onForbidden(response);
    if (response.statusCode == 404) return _onNotFound(response);
    if (response.statusCode >= 500) return _onServerError(response);
    return _onUnknownError();
  }

  ///
  /// This will handle response on 200  status code
  ///
  _onSuccess(Response response) {
    return response.body;
  }

  ///
  /// This will handle response on 500 or above status code
  ///
  _onServerError(Response response) {
    ErrorModel error = errorModelFromJson(response.body);
    return ServerException(error.message ?? "Internal Server Error");
  }

  ///
  /// This will handle response on 401
  ///
  _onUnAuthorized(Response response) {
    appPrint("should logout: 401");
    ErrorModel error = errorModelFromJson(response.body);
    appPrint("UnAuthError: ${error.message}");
    return UnAuthException(error.message ?? "UnAuthorized");
  }

  ///
  /// This will handle response on 403 status code
  ///
  _onForbidden(Response response) {
    ErrorModel error = errorModelFromJson(response.body);
    return ForbiddenException(error.message ?? "Request Forbidden");
  }

  ///
  /// This will handle response on 400 or above status code
  ///
  _onBadRequest(Response response) {
    ErrorModel error = errorModelFromJson(response.body);
    return BadRequestException(error.message ?? "Bad Request");
  }

  ///
  /// This will handle unknown errors or exception
  ///
  _onUnknownError() {
    return UnknownException("Something went wrong");
  }

  ///
  /// This will handle response on 404 status code
  ///
  _onNotFound(Response response) {
    ErrorModel error = errorModelFromJson(response.body);
    return NoDataException(error.message ?? "Not Data Found");
  }
}
