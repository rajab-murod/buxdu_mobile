import 'dart:convert';

import 'package:buxdumobile/request/request.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  final formKey = GlobalKey<FormState>();
  String _fio;
  String _comment;
  bool _result=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave a comment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Sizning fikringiz biz uchun muhim.Dastur haqida o`z fikringiz va takliflaringiz bo`lsa ushbu forma orqali jo`natishingiz mumkin.Rahmat!",
                      style: TextStyle(
                        fontFamily: 'Spectral',
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0
                      ),

                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      autofocus: false,
                      
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First name',
                        filled: true,
                        contentPadding: EdgeInsets.all(5.0),

                        fillColor: Colors.grey[200],
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey[200])
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey[200])
                        )
                      ),

                      validator: (value) => value.isEmpty ? 'This field is not empty':null,
                      onSaved: (value) => _fio = value,

                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Comment',
                          filled: true,
                          contentPadding: EdgeInsets.all(5.0),

                          fillColor: Colors.grey[200],
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey[200])
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey[200])
                          )
                      ),

                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      maxLength: 1000,
                      validator: (value) => value.isEmpty ? 'This field is not empty':null,
                      onSaved: (value) => _comment = value,
                    ),
                    RaisedButton(

                      onPressed: (){
                        validate();
                      },
                      child: Text('Submit'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 10,
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resultDialog(String title,String content){
    showDialog(
        context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      )
    );
  }
  void validate() async{
    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      var response = await Request.insert_comment(_fio,_comment);

      if(response == 201){
        resultDialog('Success',
            'Your comment successfully saved.Thank you:)');

        setState(() {
          _result = true;
        });

      }else{
        resultDialog('Oops!!!',
            'There is some error:( Check internet connect');
        setState(() {
          _result = false;
        });
      }
    }
  }

}
