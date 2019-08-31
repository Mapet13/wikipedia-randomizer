import 'package:flutter/material.dart';

import '../models/wikipediaPageContent.dart';
import 'openInBrowserButton.dart';

class ContentPresenter extends StatelessWidget {
  ContentPresenter(this._page);

  final WikipediaPageContent _page;

  titleSection() 
    => Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        _page.title,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ));

  descriptionSection() 
    => Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 22),
      child: Text(
        _page.description,
        softWrap: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleSection(),
        descriptionSection(),
        OpenInBrowserButton(_page.url)
    ]);
  }
}
