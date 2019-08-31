class WikipediaPageContent {
  WikipediaPageContent({
    this.title: '', 
    this.description: '', 
    this.url: ''
  });

  String title; 
  String description;
  String url;

  bool operator ==(o) 
    => o is WikipediaPageContent 
    && o.title == title 
    && o.description == description
    && o.url == url;

  int get hashCode
    => title.hashCode^description.hashCode^url.hashCode;

  String toString() {
    return 'title: "$title", description: "$title", url: "$title"';
  }
}