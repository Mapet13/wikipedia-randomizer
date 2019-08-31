import 'package:flutter/material.dart';

import '../widgets/ContentSlider.dart';
import '../widgets/logoImage.dart';

class WikipediaRandomizerView extends StatefulWidget {
  @override
  _WikipediaRandomizerViewState createState() => _WikipediaRandomizerViewState();
}

class _WikipediaRandomizerViewState extends State<WikipediaRandomizerView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [LogoImage(), ContentSlide()],
        )
      )
    );
  }
}