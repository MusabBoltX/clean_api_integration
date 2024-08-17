class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class NoDataException implements Exception {
  final String message;

  NoDataException([this.message = 'No data found.']);

  @override
  String toString() {
    return 'NoDataFoundException: $message';
  }
}

class UnAuthException implements Exception {
  final String message;

  UnAuthException([this.message = 'UnAuthenticated']);

  @override
  String toString() {
    return message;
  }
}

class ForbiddenException implements Exception {
  final String message;

  ForbiddenException([this.message = 'ForbiddenException']);

  @override
  String toString() {
    return message;
  }
}

class BadRequestException implements Exception {
  final String message;

  BadRequestException([this.message = 'BadRequestException']);

  @override
  String toString() {
    return message;
  }
}

class UnknownException implements Exception {
  final String message;

  UnknownException([this.message = 'UnknownException']);

  @override
  String toString() {
    return message;
  }
}
