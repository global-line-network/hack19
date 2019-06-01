class UnAuthorizedUserException implements Exception {
  final String message;
  final int code;

  UnAuthorizedUserException(this.message, this.code);

  @override
  String toString() {
    if (message == null) return "Exception";
    return "$message";
  }
}
