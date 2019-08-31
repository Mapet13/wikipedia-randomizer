import 'dart:convert';

import 'pageParserUtilities.dart';

import '../models/wikipediaPageContent.dart';
import 'pageParser.dart';

class WikipediaPageParser extends PageParser {
  final titleParser = PageTitleParser();
  final descriptionParser = PageDescriptionParser();
  final urlParser = PageURLParser(); 

  @override
  WikipediaPageContent parseResponseBody(String body) {
    var query = _getQueryFromBody(body);

    return WikipediaPageContent(
        title: titleParser(query),
        description: descriptionParser(query),
        url: urlParser(query));
  }

  String _getQueryFromBody(String body) {
    try {
      Map<String, dynamic> json = jsonDecode(body);
      return json['query'].toString();
    } catch(e) {
      return '';
    }
  }

}
