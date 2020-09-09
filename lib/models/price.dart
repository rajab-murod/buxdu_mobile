
class Price{
  String yunalish;
  String price_li;
  String price_siz;


  Price({this.yunalish,this.price_li,this.price_siz});


  factory Price.fromJson(Map<String,dynamic> json){
    return Price(
      yunalish: json['col2'] as String,
      price_li: json['col7'] as String,
      price_siz: json['col8'] as String
    );
  }
}