class FetchDataException implements Exception {
  final String message;
  final int code;

  FetchDataException(this.message, this.code);

  @override
  String toString() {
    if (message == null) return "Exception";
    return "$message";
  }
}
