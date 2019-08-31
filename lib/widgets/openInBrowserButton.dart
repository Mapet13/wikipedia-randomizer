import 'package:flutter/material.dart';
import '../utils/urlLauncher.dart';
import '../config/config.dart';

class OpenInBrowserButton extends StatelessWidget {
  OpenInBrowserButton(this.url);

  final String url;
  final openInWikipediaText = Config.language == Languages.pl
      ? 'Otwórz w Wikipedii'
      : 'Open in Wikipedia';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 200),
        child: FlatButton(
            textColor: Colors.grey,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                openInWikipediaText,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            onPressed: () {
              launchURL(url);
            }));
  }
}