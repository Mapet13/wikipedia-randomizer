import 'package:flutter/material.dart';

import '../models/wikipediaPageContent.dart';
import '../blocs/ContentSliderBloc.dart';
import '../config/config.dart';

import 'contentPresenter.dart';

class ContentSlide extends StatefulWidget {
  @override
  _ContentSlideState createState() => _ContentSlideState();
}

class _ContentSlideState extends State<ContentSlide> {
  int _index = 0;
  bool _started = false;

  final _block = ContentSliderBloc();
  final _startingPageHelpingText = Config.language == Languages.pl
      ? 'Przesuń w lewo aby wylosować nową stronę z Wikipedii'
      : 'Swipe left to draw a new Wikipedia page';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _block.page,
        builder: (context, AsyncSnapshot<WikipediaPageContent> snapshot) {
          debugPrint(_index.toString());
          if (snapshot.hasData) {
            debugPrint("234");
            return _slider(snapshot.data);
          }
          return _slider(WikipediaPageContent());
        });
  }
  
  Widget get _startingField 
    => Container(
        child: Text(
          _startingPageHelpingText,
          style: TextStyle(
              color: Colors.grey, fontSize: 25, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.only(left: 30, right: 30, top: 150),
      );

  Widget _slider(WikipediaPageContent page) {
    return Dismissible(
        child: (_started ? ContentPresenter(page) : _startingField),
        direction: (_started ? DismissDirection.horizontal : DismissDirection.endToStart),
        key: Key(_index.toString()),
        resizeDuration: null,
        onDismissed: _onDissmised
    );
  }

  void _onDissmised(DismissDirection dir) async {
    if (dir == DismissDirection.endToStart) {
      _started = true;
      _index++;
      _block.goToNextPage();
    } else if (dir == DismissDirection.startToEnd) {
      if (_index != 0) {
        _index--;
        _block.goToPrevousPage();
      }
      if (_index == 0) {
        _started = false;
      }
    }
  }

}
