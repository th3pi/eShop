import 'package:flutter/material.dart';

import 'products.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  FocusNode firstNode = FocusNode();
  FocusNode secondNode = FocusNode();
  String username, password = '';
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ListView(
          children: <Widget>[
            TextField(
              focusNode: firstNode,
              onSubmitted: (String value) {
                username = value;
                FocusScope.of(context).requestFocus(secondNode);
              },
              decoration: InputDecoration(labelText: 'Username'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                username = value;
              },
            ),
            TextField(
              focusNode: secondNode,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: _showPassword ? false : true,
              onChanged: (String value) {
                password = value;
              },
            ),
            CheckboxListTile(
              title: Text('Show Password'),
              value: _showPassword,
              onChanged: (bool value) {
                setState(() {
                  _showPassword = value;
                });
              },
            ),
            RaisedButton(
              elevation: 2,
              child: Text('Login'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'products');
              },
            )
          ],
        ),
      ),
    );
  }
}
