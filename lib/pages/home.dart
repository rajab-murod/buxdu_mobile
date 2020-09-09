import 'package:flutter/material.dart';

import 'package:buxdumobile/pages/contact.dart';
import 'package:buxdumobile/pages/payment.dart';
import 'package:buxdumobile/pages/contract_price.dart';
import 'package:buxdumobile/pages/faq.dart';
import 'package:buxdumobile/pages/about.dart';
import 'package:buxdumobile/pages/comment.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[300]
              ),

              child:Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('assets/home/drawer.jpg'),
                    ),
                  ],
                ),
              )
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ContactPage()
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AboutPage()
                ));
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left:20.0,right: 20.0),
        child: GridView.count(
          padding: EdgeInsets.all(15.0),
            crossAxisCount: 2,
          children: <Widget>[

            homeCard('Payments', 'assets/home/payment.png',onclick: onPayment),
            homeCard('Contract prices', 'assets/home/contract.png',onclick: onContract),
            homeCard('FAQ', 'assets/home/faq2.png',onclick: onFaq),
            homeCard('Leave a comment', 'assets/home/comment.png',onclick: onComment),

          ],
        ),
      )
    );
  }

  void onPayment(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => PaymentPage()
    ));
  }

  void onContract(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ContractPage()
    ));
  }

  void onFaq(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => FaqPage()
    ));
  }

  void onComment(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => CommentPage()
    ));
  }

  Widget homeCard(String title,String image,{Function onclick}){
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: InkWell(
        child: Column(
          children: <Widget>[
            Image.asset(image,width: 110.0,height: 110.0,),
            SizedBox(height: 10.0,),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        onTap: onclick,
      ),
    );

  }
}
