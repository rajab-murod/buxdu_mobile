class Subject{
  String yunalish;
  String total_li;
  String total_siz;



  Subject({this.yunalish,this.total_li,this.total_siz});


  factory Subject.fromJson(Map<String,dynamic> json){
    return Subject(
        yunalish: json['col2'] as String,
        total_li:json['col7'] as String,
        total_siz: json['col8'] as String
    );
  }
}