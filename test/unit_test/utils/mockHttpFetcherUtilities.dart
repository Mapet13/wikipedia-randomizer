import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../lib/utils/httpFetcher.dart';

class MockClient extends Mock implements http.Client {}

class MockHttpFetcherUtilities {
  MockHttpFetcherUtilities() {
    fetcher = HttpFetcher(client);
  }

  var client = MockClient();
  var fetcher;
  var url = 'url';

  Future<http.Response> getPageWithValidResponse(String fetchedPage) async {
    when(client.get(url))
      .thenAnswer((_) async => http.Response(fetchedPage, 200));

    return fetcher.fetchPage(url);
  }

  Future<http.Response> getPageWithErrorResponse() async {
    when(client.get(url))
      .thenAnswer((_) async => http.Response('', 400));

    return fetcher.fetchPage(url);
  }
}