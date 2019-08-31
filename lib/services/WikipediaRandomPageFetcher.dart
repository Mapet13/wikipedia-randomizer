import 'package:http/http.dart' as http;

import '../utils/httpFetcher.dart';
import '../config/config.dart';
import 'WikipediaPageFetcher.dart';

class WikipediaRandomPageFetcher extends WikipediaPageFetcher {
  final _url = 'https://${Config.language.languageSign}.wikipedia.org/w/api.php?format=json&&prop=extracts|info&exintro&explaintext&action=query&inprop=url&generator=random&grnnamespace=0';
  final _fetcher = HttpFetcher(http.Client());

  Future<String> fetchPageBody() async {
    var response = await _fetcher.fetchPage(_url);
    return response.body;
  }
}
