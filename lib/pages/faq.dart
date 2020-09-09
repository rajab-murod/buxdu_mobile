import 'dart:convert';

import 'package:buxdumobile/models/faq_item.dart';
import 'package:buxdumobile/request/request.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<FaqItem> _faq = List();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    faqItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FAQ'),
      ),
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh:() async{
          await Future.delayed(Duration(seconds: 2), () {
            faqItem();
          });
        },
        displacement: 40.0,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: _buildPanel(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void faqItem() async{
    var _data;
    var response = await Request.get_faq();
    if(response != null){
      _data = json.decode(response);

      setState(() {
        _faq = (_data as List)
            .map((data) => FaqItem.fromJson(data))
            .toList();
      });

    }else{
      print("none");

    }
  }


  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _faq[index].isExpanded = !isExpanded;
        });
      },
      children: _faq.map<ExpansionPanel>((FaqItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.0),),
            );
          },
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(item.expandedValue),
              )
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
