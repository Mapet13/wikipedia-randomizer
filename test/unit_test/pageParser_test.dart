import 'package:test/test.dart';

import 'utils/pageParserTestUtilities.dart';

main() {
  
  test("Returns correctly parsed page when receives a page with all[title, description, url] correct information", () {
    var validPageParser = FakeValidPageParser();
    var actualParsedPage = validPageParser.parse();

    expect(actualParsedPage, validPageParser.parsedPage);
  });

  test("Returns blank page when receives an error page", () {
    var errorPageParser = ErrorPageParser();
    var actualParsedPage = errorPageParser.parse();

    expect(actualParsedPage, errorPageParser.parsedPage);
  });

}