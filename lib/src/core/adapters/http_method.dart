enum HttpMethod { get, post, patch, put, delete, download }

extension ToUpperCase on HttpMethod {
  String name() {
    return toString().split('.').last.toUpperCase();
  }
}
