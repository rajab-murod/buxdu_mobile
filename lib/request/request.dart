import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:buxdumobile/models/faq_item.dart';

class Request{
  static String URL = 'http://shartnoma.buxdu.uz/';

  static Future<String> get_payment(String id) async {
    var response = await http.get(
      "${URL}api/payment/?col5=${id}",
    );
    if(response.statusCode == 200){
      List<int> bytes = response.body.toString().codeUnits;
      return utf8.decode(bytes);
    }else{

      return null;
    }

  }

  static Future<String> get_price(String school_type,int school_year,String subject) async {
    var response = await http.get(
      "${URL}api/prices/?school_type=${school_type}&school_year=${school_year}&subject=${subject}",
    );
    if(response.statusCode == 200){
      List<int> bytes = response.body.toString().codeUnits;
      return utf8.decode(bytes);
    }else{

      return null;
    }

  }

  static Future<String> get_subject(String school_type,int school_year) async {
    var response = await http.get(
      "${URL}api/subject/?school_type=${school_type}&school_year=${school_year}",
    );
    if(response.statusCode == 200){
      List<int> bytes = response.body.toString().codeUnits;
      return utf8.decode(bytes);
    }else{

      return null;
    }

  }

  static Future<String> get_school_year() async {
    var response = await http.get(
      "${URL}api/school_year/",
    );
    if(response.statusCode == 200){
      List<int> bytes = response.body.toString().codeUnits;
      return utf8.decode(bytes);
    }else{

      return null;
    }

  }

  static Future<String> get_faq() async {
    final response = await http.get(
      "${URL}api/faqs/",
    );
    if(response.statusCode == 200){
      List<int> bytes = response.body.toString().codeUnits;
      return utf8.decode(bytes);
    }else{

      return null;
    }

  }

  static Future<int> insert_comment(String name,String text) async {
    var response = await http.post(
      "${URL}api/comment/add/",
      headers: {
        'Authorization':'Token 1db6b0122bc5320f4ecaf8195345e1754a8a6adc'
      },
      body: {
        'name':name,
        'text':text
      }
    );
    return response.statusCode;

  }
}