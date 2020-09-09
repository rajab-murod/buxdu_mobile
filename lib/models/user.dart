
class User{
  String fio;
  String fak;
  String yunalish;
  String guruh;
  String kurs;
  String ostatok;
  String summa;
  String t_summa;
  String qarz;
  String ortiqcha;
  String sana;


  User({this.guruh,this.fak,this.fio,this.yunalish,this.ortiqcha,this.qarz,this.t_summa,this.summa,this.ostatok,this.kurs,this.sana});


  factory User.fromJson(Map<String,dynamic> json){
    return User(
      fio:json['col6'],
      fak: json['col1'],
      yunalish: json['col2'],
      guruh: json['col3'],
      kurs: json['col4'],
      ostatok: json['col7'],
      summa: json['col8'],
      t_summa: json['col9'],
      qarz: json['col10'],
      ortiqcha: json['col11'],
      sana: json['col12']
    );
  }

}