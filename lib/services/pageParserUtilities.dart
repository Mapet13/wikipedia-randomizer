import '../utils/pageParserTool.dart';

class PageTitleParser extends PageParserTool {
  @override
  String call(String query) {
    try {
      return query.substring(query.indexOf('title') + 7, query.indexOf('extract') - 2);
    } catch(e) {
      return '';
    }
  }
}

class PageDescriptionParser extends PageParserTool {
  @override
  String call(String query) {
    try {
      return query.substring(query.indexOf('extract') + 9, query.indexOf(', contentmodel:'));
    } catch(e) {
      return '';
    }
  }
}

class PageURLParser extends PageParserTool {
  @override
  String call(String query) {
    try {
      return query.substring(query.indexOf('fullurl') + 9, query.indexOf(', editurl:'));
    } catch(e) {
      return '';
    }
  }
}