import '../../../lib/models/wikipediaPageContent.dart';
import '../../../lib/services/pageParser.dart';
import '../../../lib/services/WikipediaPageFetcher.dart';

class ValidPageFakeFetcher extends WikipediaPageFetcher {
  static const validPage = 'validPage';

  @override
  Future<String> fetchPageBody() async {
    return Future.value(validPage);
  }
}

class ErrorPageFakeFetcher extends WikipediaPageFetcher {
  static final exception = Exception('exceptionMessage');

  @override
  Future<String> fetchPageBody() async {
    return Future.error(exception);
  }
}

class FakePageParser extends PageParser {
  @override
  WikipediaPageContent parseResponseBody(String body) {
    return WikipediaPageContent(title: body);
  }
}