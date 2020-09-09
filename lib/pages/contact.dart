import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contact information'),
      ),
      body:Column(
        children: <Widget>[
          Card(

            color: Colors.blue[100],
            elevation: 10,
            margin: EdgeInsets.all(20.0),


            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.account_circle,size: 50.0,),
                  title: Text('Bukhara Uzbekistan, Bukhara 200114 Uzbekistan'),
                  subtitle: Text('buxdu_rektor@buxdu.uz'),
                ),
                SizedBox(height: 20.0,),
                Row(

                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.phone),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5.0,),

                        Text('+998 (65) 221-29-14')
                      ],
                    ),
                    SizedBox(width: 30.0,),
                    Icon(Icons.location_on),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 6.0,),
                        Text('M.Iqbol street 11')
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Card(
            color: Colors.blue[100],
            elevation: 10,
            margin: EdgeInsets.all(20.0),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.payment,size: 50.0,),
                  title: Text('Billing information'),
                  subtitle: Text('400910860064017950100079002'),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.phone),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                        Text('+998 (65) 221-29-74')
                      ],
                    ),
                    SizedBox(width: 30.0,),
                    Icon(Icons.account_balance_wallet),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                        Text('INN:201504275')
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
