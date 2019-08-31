import 'package:rxdart/rxdart.dart';

import '../utils/bloc.dart';
import '../models/wikipediaPageContent.dart';
import '../services/wikipediaRandomizerController.dart';

class ContentSliderBloc extends Bloc {
  ContentSliderBloc() {
    goToNextPage();
  }

  final _controller = WikipediaRandomizerController();
  final _pageStreamController = PublishSubject<WikipediaPageContent>();

  void goToNextPage() async {
    _controller.goToNextPage();
    _addCurrentPageToSink();
  }

  void goToPrevousPage() async {
    _controller.goToPreviousPage();
   _addCurrentPageToSink();
  }

  Observable<WikipediaPageContent> get page 
    => _pageStreamController.stream;

  _addCurrentPageToSink() {
    _pageStreamController.sink.add(_controller.currentPage);
  }

  @override
  dispose() {
    _pageStreamController.close();
  }
  
}