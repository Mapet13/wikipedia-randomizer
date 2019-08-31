import 'package:test/test.dart';

import '../../lib/models/wikipediaPageContent.dart';
import '../../lib/services/wikipediaPagesRepisitory.dart';

import 'utils/WikipediaPagesRepository_testUtilities.dart';

main() {

  test('Adds page to the reposytory when receives a valid page', () async {
    var matcher =  WikipediaPageContent(title: ValidPageFakeFetcher.validPage);
    var reposytory = WikipediaPagesRepository(ValidPageFakeFetcher(), FakePageParser());
    
    reposytory.addNewPage();

    Future.delayed(Duration(seconds: 3), () { 
      expect(reposytory.getPage(0), matcher); 
    });
  });

  test('Adds an error page to the reposytory when receives an error', () async {
    var matcher =  WikipediaPageContent(title: 'ERROR', description: ErrorPageFakeFetcher.exception.toString());
    var reposytory = WikipediaPagesRepository(ErrorPageFakeFetcher(), FakePageParser());
    
    reposytory.addNewPage();

    Future.delayed(Duration(seconds: 3), () { 
      expect(reposytory.getPage(0), matcher); 
    });
  });

}