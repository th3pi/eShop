import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/manager.dart';
import './pages/products.dart';
import './pages/product.dart';
import 'product_manager.dart';

void main() => runApp(MyApp());

class _MyAppState extends State<MyApp>{
  List<Map<String, String>> _products =[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
//      home: AuthPage(),
      routes: {
        'admin': (BuildContext) => ManagementPage(),
        '/': (BuildContext) => ProductsPage(_products, _addProduct, _deleteProduct)
      },
      onGenerateRoute: (RouteSettings settings) {
        print(settings.name);
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  _products[index]['title'], _products[index]['image']));
        }
        return null;
      },
    );
  }

  void _addProduct(Map<String,String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index){
    setState(() {
      _products.removeAt(index);
    });
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
