import '../models/wikipediaPageContent.dart';

abstract class PageParser {
  WikipediaPageContent parseResponseBody(String body);
}