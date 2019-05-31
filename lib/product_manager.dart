import 'package:flutter/material.dart';

import './products.dart';
import 'product_control.dart';

class ProductManager extends StatelessWidget {
  List<Map<String, String>> _products = [];
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this._products,this.addProduct,this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: ProductControl(addProduct),
          )
        ],
      ),
      Expanded(
        child: Products(_products, deleteProduct: deleteProduct,),
      )
    ]);
  }
}
