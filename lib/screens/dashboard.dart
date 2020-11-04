import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbank/screens/contact_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image.network('https://media.istockphoto.com/photos/business-office-desk-closeup-financial-reports-analysis-and-set-of-picture-id1253077034')
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/istockphoto1.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              //Material deve definir a cor, nunca os filhos do material
              color: Theme.of(context).primaryColor,
              child: InkWell(
                //Pode ser usado tb GestureDetector, InkWell necessita ser envelopado por Material
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactsList(),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  width: 150,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 32.0,
                      ),
                      Text(
                        'Contacts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
