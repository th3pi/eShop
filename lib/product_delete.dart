import 'package:flutter/material.dart';

class ProductDelete extends StatelessWidget {
  final Function deleteProduct;

  ProductDelete(this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Delete Product'),
      onPressed: () {
        deleteProduct();
      },
    );
  }
}
