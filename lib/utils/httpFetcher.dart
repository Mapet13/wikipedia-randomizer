import 'package:http/http.dart' as http;

class HttpFetcher {
  HttpFetcher(this._client);

  final http.Client _client;

  Future<http.Response> fetchPage(String url) async {
    var response = await _client.get(url);

    if (_invalidResponseStatusCode(response)) {
      throw Exception('Http status code: ${response.statusCode.toString()}');
    }

    return response;
  }

  bool _invalidResponseStatusCode(http.Response response) 
    => response.statusCode != 200;
}
