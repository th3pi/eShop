import 'package:flutter/material.dart';

import 'products.dart';
import 'product_create.dart';
import 'product_list.dart';

class ManagementPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ManagementPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('Login'),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              ListTile(
                title: Text('Products'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'product');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Product Management'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.create),
              text: 'Create Product',
            ),
            Tab(
              icon: Icon(Icons.list),
              text: 'My Products',
            )
          ]),
        ),
        body:
            TabBarView(children: <Widget>[ProductCreatePage(addProduct), ProductList()]),
      ),
    );
  }
}
