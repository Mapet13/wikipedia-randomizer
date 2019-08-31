class LanguageData {
  const LanguageData(this.languageSign);

  final String languageSign;
}

class Languages {
  const Languages._();

  static const pl = LanguageData("pl");
  static const en = LanguageData('en');
}
