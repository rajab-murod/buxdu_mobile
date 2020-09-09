import 'dart:convert';

import 'package:buxdumobile/models/price.dart';
import 'package:buxdumobile/models/school_year.dart';
import 'package:buxdumobile/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:buxdumobile/request/request.dart';
import 'package:intl/intl.dart';

class ContractPage extends StatefulWidget {
  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {

  final formKey = GlobalKey<FormState>();
   var _selected_type;
  var _selected_year;
  var _selected_subject;
  List<SchoolYear> _year=List();
  List<Subject> _subject = List();
  List<Price> _price = List();
  final moneyFormat = new NumberFormat.currency(locale: 'uz');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contract price'),
        centerTitle: true,
      ),
      body: Container(

        child: SingleChildScrollView(
//          scrollDirection: Axis.horizontal,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DropdownButtonFormField(
                        value: _selected_type,
                        elevation: 16,
                        decoration: InputDecoration(
                          labelText: 'o`quv turini tanlang'
                        ),
                        onChanged: (val){

                          setState(() {
                            _selected_type = val;
                            _price.insert(0, Price(yunalish: "",price_li: "0",price_siz: "0"));

                          });
                          get_school_year();
                          get_subject(_selected_type, _selected_year);


                        },
                        items: <String>['bakalavr', 'magistr', 'sirtqi']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField(
                        value: _selected_year,
                        elevation: 16,
                        decoration: InputDecoration(
                          labelText: 'o`quv yilini tanlang'
                        ),
                        onChanged: (val){

                          setState(() {
                            _selected_year = val;
                            _price.insert(0, Price(yunalish: "",price_li: "0",price_siz: "0"));
                          });
                          get_subject(_selected_type,_selected_year);
                        },

                        items:_year
                            .map((label) => DropdownMenuItem(
                          child: Text(label.name),
                          value: label.id,
                        ))
                            .toList(),
                      ),
//                      DropdownButtonFormField(
////                        value: _selected_subject,
//                        elevation: 16,
//
//                        decoration: InputDecoration(
//                          labelText: 'yo`nalishni tanlang',
//
//                        ),
//                        onChanged: (val){
//                          setState(() {
//                            _selected_subject = val;
//                          });
//                          validate(_selected_type, _selected_year, _selected_subject);
//
//                        },
//
//                        items:_subject
//                            .map((subject) => DropdownMenuItem(
//                          child: SizedBox(
//                            child: Text(subject.yunalish),
//                            width: 280,
//                          ),
//                          value: subject.yunalish,
//                        ))
//                            .toList(),
//                      ),
                    ],
                  ),
                ),

              ),

              Container(
                padding: EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        hint: Text('yo`nalishni tanlang'),
//                      value: _selected_subject,

                        onChanged: (String val){
                          setState(() {
                            _selected_subject = val;
                          });
                          validate(_selected_type, _selected_year, _selected_subject);
                        },
                        items: _subject?.map((item){
                          return DropdownMenuItem(
                            child: SizedBox(
                              child: Text(item.yunalish),
                              width: 270,
                            ),
                            value: item.yunalish,
                          );

                        })?.toList()??[],
                      ),
                    ),
                  ),
                ),
              ),

              priceInfo(_price[0]),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _price.insert(0, Price(yunalish: "",price_li: "0",price_siz: "0"));
    });


  }

  void get_school_year() async{
    var _data;
    var response = await Request.get_school_year();
    if(response != null){
      _data = json.decode(response);

      setState(() {
        _year = (_data as List)
            .map((data) => new SchoolYear.fromJson(data))
            .toList();
      });

    }else{

    }
  }

  void get_subject(String type,int year) async{
    var _data;
    var response = await Request.get_subject(type, year);
    if(response != null){
      _data = json.decode(response);

      setState(() {
        _subject = (_data as List)
            .map((data) => new Subject.fromJson(data))
            .toList();
      });

    }else{

    }
  }

  void validate(String type,int year,String subject) async{
    final form = formKey.currentState;
    var _data;
    if(form.validate()){
      form.save();
      var response = await Request.get_price(type,year,subject);
      if(response != null){
        _data = json.decode(response);

        setState(() {
          _price = (_data as List)
              .map((data) => new Price.fromJson(data))
              .toList();
        });

      }else{

      }
    }
  }

  DataTable priceInfo(Price obj){
    return DataTable(
        columns: [
          DataColumn(
              label: Text('Yo`nalish')
          ),
          DataColumn(
              label: Text('Stpendiyali')
          ),
          DataColumn(
              label: Text('Stpendiyasiz')
          ),

        ],
        rows:[
          DataRow(
              cells: [
                DataCell(
                    Text(obj.yunalish)
                ),
                DataCell(
                    Text( obj.price_li != null ? '${moneyFormat.format(double.parse(obj.price_li))}' : " ")
                ),
                DataCell(
                    Text('${moneyFormat.format(double.parse(obj.price_siz))}')
                ),

              ]
          ),
        ]
    );
  }

}

