
class SchoolYear{
  int id;
  String name;


  SchoolYear({this.id,this.name});


  factory SchoolYear.fromJson(Map<String,dynamic> json){
    return SchoolYear(
        id: json['id'] as int,
        name: json['name'] as String,
    );
  }
}