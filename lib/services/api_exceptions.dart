class ApiExceptions implements Exception {
  final _message;
  final _prefix;

  ApiExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends ApiExceptions {
  FetchDataException([String message]) 
  : super(message, 'Communication error:');
}