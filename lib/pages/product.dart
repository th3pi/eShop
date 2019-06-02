import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title, imageUrl;

  ProductPage(this.title, this.imageUrl);

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone'),
            actions: <Widget>[
              FlatButton(
                child: Text('Delete'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  Navigator.pop(context); // This only closes the dialog
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(title),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('DELETE'),
                  onPressed: () {
                    _showDialog(context);
                  },
                ),
              )
            ],
          ))),
    );
  }
}
