import '../../../lib/models/wikipediaPageContent.dart';
import '../../../lib/services/WikipediaPageParser.dart';

class PageParserTestUtilities {
  var parser = WikipediaPageParser();
  String page;

  WikipediaPageContent parse()
    => parser.parseResponseBody(page);
}

class FakeValidPageParser extends PageParserTestUtilities {
  FakeValidPageParser() {
    page = '{"batchcomplete":"","continue":{"grncontinue":"0.999999999999|0.999999999999|9999999|0","continue":"grncontinue||"},"query":{"pages":{"9999999":{"pageid":9999999,"ns":0,"title":"${parsedPage.title}","extract":"${parsedPage.description}","contentmodel":"wikitext","pagelanguage":"pl","pagelanguagehtmlcode":"pl","pagelanguagedir":"ltr","touched":"9999-99-99T99:99:99Z","lastrevid":12345678,"length":1234,"fullurl":"${parsedPage.url}","editurl":"editurl","canonicalurl":"canonicalurl"}}}}';
  }

  final parsedPage = WikipediaPageContent(
    title: 'TITLE',
    description: 'DESCRIPTION',
    url: 'URL' 
    );
}

class ErrorPageParser extends PageParserTestUtilities {
  ErrorPageParser() {
    page = '{errorPage}';
  }

  final parsedPage = WikipediaPageContent();
}
