import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:buxdumobile/request/request.dart';
import 'package:buxdumobile/models/user.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _id;
  List<User>myUser = List();
  bool _result = false;
  final formKey = GlobalKey<FormState>();

  final moneyFormat = new NumberFormat.currency(locale: 'uz');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments view'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter student`s id code',
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
                        validator: (value) => value.isEmpty ? 'Enter correct id code like this (002-******)':null,
                        onSaved: (value) => _id = value,
                      ),
                      RaisedButton(
                        child: Text('Submit'),

                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 10,
                        onPressed: (){
                          validate();
                          showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return Center(child: CircularProgressIndicator(),);
                            }
                          );
                          Future.delayed(Duration(seconds: 1)).then((value){
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (_) => _result ? new AlertDialog(
                                  title: new Text('${myUser[0].fio} (${myUser[0].guruh})'),
                                  content: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      height: 200.0,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Shartnoma narxi:     ${moneyFormat.format(double.parse(myUser[0].summa.toString()))}',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
//                                        SizedBox(height: 8.0,),
                                          paymentInfo(myUser[0]),
//                                        SizedBox(height: 10.0,),
                                          Text('Ma`lumotlar ${myUser[0].sana} sanada yangilangan',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    )
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                )
                            : new AlertDialog(
                                  title: Text('Oops!!!'),
                                  content: Text('Data not found:( Check internet connect or enter correct id code and try again!'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                )
                            );
                          });

                        },
                      )
                    ],
                  ),
                ),

              ),
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
  }


  void validate() async{
    final form = formKey.currentState;
    var _data;
    if(form.validate()){
      form.save();
      var response = await Request.get_payment(_id);
      if(response != null){
        _data = json.decode(response);
        setState(() {
          myUser = (_data as List)
          .map((data) => User.fromJson(data)).toList();
          _result = true;
        });
      }else{
        setState(() {
          myUser = null;
          _result = false;
        });
      }
    }
  }

  DataTable paymentInfo(User myUser){
    return DataTable(
      columns: [
        DataColumn(
          label: Text('Qarz')
        ),
        DataColumn(
          label: Text('To`langan')
        ),
        DataColumn(
            label: Text('Ostatok')
        ),
        DataColumn(
            label: Text('Ortiqcha')
        ),
      ],
      rows:[
        DataRow(
          cells: [
            DataCell(
                Text(myUser.qarz.toString())
            ),
            DataCell(
                Text(myUser.t_summa.toString())
            ),
            DataCell(
                Text(myUser.ostatok.toString())
            ),
            DataCell(
                Text(myUser.ortiqcha.toString())
            ),
          ]
        ),
      ]
    );
  }

}
