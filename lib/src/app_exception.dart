class AppException implements Exception {
  String _message;
  AppException(this._message);
  
  @override
  String toString() => _message;
}
