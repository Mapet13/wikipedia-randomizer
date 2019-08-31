import '../models/wikipediaPageContent.dart';
import 'WikipediaPageFetcher.dart';
import 'pageParser.dart';

class WikipediaPagesRepository {
  WikipediaPagesRepository(
    this._fetcher,
    this._pageParser  
  );

  final WikipediaPageFetcher _fetcher;
  final PageParser _pageParser;
  var _pages = <WikipediaPageContent>[];

  void addNewPage() async {
    await _getNewPageBody()
      .then(_addNewPage)
      .catchError(_addErrorPage);
  }

  void addBlankPage() {
    _pages.add(WikipediaPageContent());
  }

  WikipediaPageContent getPage(int index) 
    => _pages[index];

  int get length 
    => _pages.length; 

  void _addNewPage(String body) {
    _pages.add(_pageParser.parseResponseBody(body));
  }

  void _addErrorPage(e) {
    _pages.add(_createErrorPage(e));
  }

  WikipediaPageContent _createErrorPage(e) 
    => WikipediaPageContent(title: "ERROR", description: e.toString());

  Future<String> _getNewPageBody() async 
    => await _fetcher.fetchPageBody();
}