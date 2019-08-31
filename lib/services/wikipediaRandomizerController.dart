import 'WikipediaPageParser.dart';
import '../models/wikipediaPageContent.dart';
import '../services/wikipediaPagesRepisitory.dart';
import '../services/WikipediaRandomPageFetcher.dart';

class WikipediaRandomizerController {
  WikipediaRandomizerController() {
    _reposytory.addBlankPage();
  }

  final _reposytory = WikipediaPagesRepository(WikipediaRandomPageFetcher(), WikipediaPageParser());
  int _currentIndex = -1;


  void goToNextPage() async {
    _currentIndex++;
    if (_shouldGetNewPage()) {
      _reposytory.addNewPage();
    }
  }

  void goToPreviousPage() {
    if (_canDecrement()) {
      --_currentIndex;
    }
  }

  WikipediaPageContent get currentPage 
    => _reposytory.getPage(_currentIndex);

  bool _canDecrement() 
    => _currentIndex > 0;

  bool _shouldGetNewPage() 
    => _currentIndex >= _reposytory.length - 1;
}
