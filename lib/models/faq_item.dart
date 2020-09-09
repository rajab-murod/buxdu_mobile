class FaqItem {
  FaqItem({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;

  factory FaqItem.fromJson(Map<String,dynamic> json){
    return FaqItem(
      headerValue: json['title'],
      expandedValue: json['text']
    );
  }

}